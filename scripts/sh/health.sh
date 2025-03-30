#!/bin/bash

# Health check script for all services defined in Terraform
# Basic usage (text output)
# ./health-check.sh

# # JSON format output
# ./health-check.sh --format json

# # Using HTTP protocol instead of HTTPS
# ./health-check.sh --protocol http

# # Longer timeout for slow services (10 seconds)
# ./health-check.sh --timeout 10
TIMEOUT=5
FORMAT="json"
DEFAULT_PROTOCOL="https"
OUTPUT_DIR="../output_files"
TFVARS_FILE="/mnt/chatting/projects/homelab/terraform/prod/caddy.auto.tfvars"

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

extract_services() {
    grep -A 5 "^  [a-zA-Z0-9_]* = {" $TFVARS_FILE | 
    sed -n 's/^\s*\([a-zA-Z0-9_]*\) = {/\1/p' | 
    tr -d ' ' > /tmp/service_names.txt

    grep -A 5 "^  [a-zA-Z0-9_]* = {" $TFVARS_FILE | 
    grep "subdomain" | 
    sed 's/.*subdomain = "\([^"]*\)".*/\1/' > /tmp/service_subdomains.txt

    MAIN_DOMAIN=$(grep "^main_domain" $TFVARS_FILE | sed 's/.*= "\([^"]*\)".*/\1/')
    echo $MAIN_DOMAIN > /tmp/main_domain.txt
}

check_service() {
    local service=$1
    local subdomain=$2
    local main_domain=$3
    local url="${DEFAULT_PROTOCOL}://${subdomain}.${main_domain}"
    
    local start_time=$(date +%s.%N)
    local status_code=$(curl -o /dev/null -s -w "%{http_code}" --max-time $TIMEOUT $url)
    local end_time=$(date +%s.%N)
    local response_time=$(echo "$end_time - $start_time" | bc)
    
    local status="DOWN"
    if [[ "$status_code" -ge 200 && "$status_code" -lt 400 ]]; then
        status="UP"
        # Record the last seen date for UP services
        echo "${url} $(date +%Y-%m-%d)" >> $OUTPUT_DIR/last_seen
        return
    fi
    
    echo "  \"$service\": {"
    echo "    \"url\": \"$url\","
    echo "    \"status\": \"$status\","
    echo "    \"status_code\": \"$status_code\","
    echo "    \"response_time\": \"$response_time\""
    echo "  }$([ $4 == "last" ] || echo ",")"
}

main() {
    extract_services
    
    MAIN_DOMAIN=$(cat /tmp/main_domain.txt)
    mapfile -t SERVICE_NAMES < /tmp/service_names.txt
    mapfile -t SERVICE_SUBDOMAINS < /tmp/service_subdomains.txt
    
    # Create timestamp for filename
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    OUTPUT_FILE="$OUTPUT_DIR/health_check_$TIMESTAMP.json"
    
    echo "{" > $OUTPUT_FILE
    echo "  \"timestamp\": \"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\"," >> $OUTPUT_FILE
    echo "  \"services\": {" >> $OUTPUT_FILE
    
    local has_down_services=false
    for i in "${!SERVICE_NAMES[@]}"; do
        if [[ $(( i + 1 )) -eq ${#SERVICE_NAMES[@]} ]]; then
            is_last="last"
        else
            is_last="not_last"
        fi
        
        # Capture the output of check_service
        output=$(check_service "${SERVICE_NAMES[$i]}" "${SERVICE_SUBDOMAINS[$i]}" "$MAIN_DOMAIN" "$is_last")
        echo "$output" >> $OUTPUT_FILE
        
        if [[ $? -eq 0 ]]; then
            has_down_services=true
        fi
    done
    
    echo "  }" >> $OUTPUT_FILE
    echo "}" >> $OUTPUT_FILE

    if [[ "$has_down_services" == "false" ]]; then
        echo "All services are UP!" >> $OUTPUT_FILE
    fi
    
    # Create a symlink to the latest health check
    ln -sf "health_check_$TIMESTAMP.json" "$OUTPUT_DIR/health_check_latest.json"
    
    echo "Health check completed. Results saved to $OUTPUT_FILE"
    
    rm -f /tmp/service_names.txt /tmp/service_subdomains.txt /tmp/main_domain.txt
}

main