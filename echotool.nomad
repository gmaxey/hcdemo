job "echotool" {
  datacenters = ["dc1"]

  group "example" {
    task "run" {
	  driver = "raw_exec"

	  config {
		# When running a binary that exists on the host, the path must be absolute/
		command = "start"
		args    = ["/b","C:/Temp/echotool","/p","tcp","/s","12344",">C:\\Temp\\echotool.log"]
	  }

      resources {
        network {
          mbits = 10
        }
      }
    }
  }
}
