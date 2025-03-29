op_account  = "RARGQUHHTZD7DNMV7FCDJFVQKM"
token       = "eyJhbGciOiJFUzI1NiIsImtpZCI6Ind3cXJ5ZXFzN2lsMjd2bWQ1c293ZGRiYndpIiwidHlwIjoiSldUIn0.eyIxcGFzc3dvcmQuY29tL2F1dWlkIjoiSk5GTVI0UFpBQkRGVE1ZRkNLSUlGS0hZSVUiLCIxcGFzc3dvcmQuY29tL3Rva2VuIjoiRkJaaF9DTnAtN2pQY3lPcmZsMXR2U0l3NG85X2liZnMiLCIxcGFzc3dvcmQuY29tL2Z0cyI6WyJ2YXVsdGFjY2VzcyJdLCIxcGFzc3dvcmQuY29tL3Z0cyI6W3sidSI6Im1xcndyaWcyNGZ4czNzc3l3bWYzcHh3cWd5IiwiYSI6NDh9XSwiYXVkIjpbImNvbS4xcGFzc3dvcmQuY29ubmVjdCJdLCJzdWIiOiJQRklBTE83NkNSSERUQlQzM01EWjRFSTc3NCIsImlhdCI6MTc0MTk3MDYzOCwiaXNzIjoiY29tLjFwYXNzd29yZC5iNSIsImp0aSI6IjNueGJjM3N2d25ieHdoamlsdGJoM3Z5a29hIn0.JnslSNoH75q7fk459tzE-vME-QRU54Przk0uPpAaIakFYMCGnRi-XH3mpVETySGj2fB7aJb5fMhAjFI34yEqXw"
connect_url = "http://192.168.1.182:8080"
op_cli_path = "/usr/bin/op"
vaults = {
  services = {
    uuid = "mqrwrig24fxs3ssywmf3pxwqgy"
    name = "services"
  }
  #   private = {
  #     uuid = "fa7tpjonf3fkbzugw3avrt6sey"
  #     name = "private"
  #   }
  #   shared = {
  #     uuid = "n2yauxnc6a3tdz5t5vngxaimuq"
  #     name = "shared"
  #   }
}

items = {
  test_credential_tf = {
    title    = "test_credential_tf"
    vault    = "services"
    username = "root@pve"
    host     = "pve.example.com"
  }
}

