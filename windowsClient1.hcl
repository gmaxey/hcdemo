# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "C:/Temp/windowsClient1"

# Give the agent a unique name. Defaults to hostname
name = "windowsClient1"

# Enable the client
client {
    enabled = true
	options = {
		"driver.raw_exec.enable" = "1"
	  }
    servers = ["nomad:4647"]
}

# Modify our port to avoid a collision with server1
ports {
    http = 5657
}
