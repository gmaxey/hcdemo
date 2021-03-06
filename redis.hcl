job "redis" {
	datacenters = ["dc1"]
	type = "service"
	update {
		max_parallel = 1
		min_healthy_time = "10s"
		healthy_deadline = "3m"
		progress_deadline = "10m"
		auto_revert = false
		canary = 0
	}

	migrate {
		max_parallel = 1
		health_check = "checks"
		min_healthy_time = "10s"
		healthy_deadline = "5m"
	}
	group "cache" {
		count = 1
		constraint {
			attribute = "${attr.kernel.name}"
			value = "linux"
		}
		restart {
			attempts = 2
			interval = "30m"
			delay = "15s"
			mode = "fail"
		}
		ephemeral_disk {
			size = 300
		}

		task "redis" {
			driver = "docker"
			config {
				image = "redis:4.0" # 3.2, 4.0
				port_map {
					db = 6379
				}
			}
			resources {
				cpu = 100 # 500 MHz
				memory = 16 # 256MB
				network {
					mbits = 10
					port "db" {}
				}
			}
			service {
				name = "redis-cache"
				tags = ["global", "cache"]
				port = "db"
				check {
					name = "alive"
					type = "tcp"
					interval = "10s"
					timeout = "2s"
				}
			}

		}
#	task "test" {
#			driver = "raw_exec"
#			config {
#				command = "printf"
#				args	= ["'ping\\r\\n'","|","nc","${NOMAD_IP_db}","${NOMAD_PORT_db}"]
#			}
#
#			resources {
#				memory = 128
#			}
#	}
	}
}

