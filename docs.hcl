job "docs" {
	datacenters = ["dc1"]
	type = "service" # service, batch, system
	constraint {
		attribute = "${attr.kernel.name}"
		value = "linux"
	}
	group "example" {
		task "server" {
			driver = "docker" # Exec, Java, LXC, Qemu, Rkt, Custom

			config {
				image = "hashicorp/http-echo"
				args = [
					"-listen", ":5678",
					"-text", "hello world",
				]
			}

			resources {
				network {
					mbits = 10
					port "http" {
						static = "5678"
					}
				}
			}
		}
	}
}
