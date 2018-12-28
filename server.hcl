# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/nomadServer1"

advertise {
  # This should be the IP of THIS MACHINE and must be routable by every node
  # in your cluster
  rpc = "nomad:4647"
}

# Enable the server
server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}
