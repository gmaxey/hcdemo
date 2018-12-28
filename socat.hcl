job "socat" {
  type = "service"
  constraint {
    attribute = "${attr.kernel.name}"
    value = "linux"
  }

  datacenters = ["dc1"]

  group "example" {

    task "server" {
      driver = "raw_exec"
      config {
        command = "/usr/bin/socat"
        args  = ["tcp-l:8181,fork","exec:'/bin/cat'"]
      }

      resources {
        memory = 128
      }
      constraint {
        attribute = "${attr.kernel.name}"
        value = "linux"
      }
    }
  }
}
