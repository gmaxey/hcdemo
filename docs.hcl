job "docs" {
  datacenters = ["dc1"]

  group "example" {
    constraint {
      attribute = "${attr.kernel.name}"
      value = "linux"
    }
    task "server" {
      driver = "docker"
      config {
        image = "hashicorp/http-echo"
        args  = ["-text", "hello", "-listen", ":8080" ]
      }

      resources {
        memory = 128
      }
    }
  }
}
