job "pingWindows" {
  datacenters = ["dc1"]
#  type = "batch"
#  periodic {
#    // Launch every 10 seconds
#    cron = "*/10 * * * * * *"

#    // Do not allow overlapping runs.
#    prohibit_overlap = true
#  }

  group "example" {
    constraint {
      attribute = "${attr.kernel.name}"
      value = "windows"
    }

    task "example" {
	  driver = "raw_exec"

	  config {
		# When running a binary that exists on the host, the path must be absolute/
		command = "ping"
		args    = ["localhost","-n","4"]
	  }

      resources {
        network {
          mbits = 10
        }
      }
    }
  }
}

