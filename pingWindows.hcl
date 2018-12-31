job "ping" {
	datacenters = ["dc1"]
	constraint {
		attribute = "${attr.kernel.name}"
		value = "windows"
	}
	group "example" {
		task "example" {
			driver = "raw_exec"

			config {
				# When running a binary that exists on the host, the path must be absolute/
				command = "ping"
				args		= ["localhost","-n","4"]
			}

			resources {
				network {
					mbits = 10
				}
			}
		}
	}
}


