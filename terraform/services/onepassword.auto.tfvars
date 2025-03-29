onepassword_token = ""
onepassword_connect_url = "http://connect-server:8080"

onepassword_vaults = {
  example = {
    name = "example-vault"
    uuid = ""
  }
}

onepassword_items = {
  example = {
    title = "example-item"
    vault = "example-vault"
    category = "login"
    tags = ["terraform-managed"]
  }
} 