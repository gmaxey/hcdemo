job "echotool" {
  datacenters = ["dc1"]

  group "example" {
    constraint {
      attribute = "${attr.kernel.name}"
      value = "windows"
    }

    task "run" {
	  driver = "raw_exec"

	  config {
		# When running a binary that exists on the host, the path must be absolute/
		command = "echotool.exe"
		args    = ["/p","tcp","/s","12344",">C:\\Temp\\echotool.log"]
	  }
          artifact {
                source = "https://github.com/pbansky/EchoTool/releases/download/v1.5.0.0/echotool.exe"
                options {
                    #checksum = "sha256:adf767759d3ad84a16b4b6de66ddf5d5ebdc779c1d76d3e0ec863ac84c5e8235"
                }
            }
      resources {
        network {
          mbits = 10
        }
      }
    }
  }
}
