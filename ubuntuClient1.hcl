# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/ubuntuClient1"

# Give the agent a unique name. Defaults to hostname
name = "ubuntuClient1"

# Enable the client
client {
	enabled = true
	options = {
		"driver.raw_exec.enable" = "1"
	}

	# For demo assume we are talking to server1. For production,
	# this should be like "nomad.service.consul:4647" and a system
	# like Consul used for service discovery.
	servers = ["nomad:4647"]
}

# Modify our port to avoid a collision with server1
ports {
	http = 5656
}

