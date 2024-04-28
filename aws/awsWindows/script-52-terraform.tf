resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "echo 'Hello World' && pwd && whoami && ping -c 4 127.0.0.1"
  }
}
