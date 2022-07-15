resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  security_groups = ["launch-wizard-1"]
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
  }
  key_name = data.aws_key_pair.example.key_name
  tags = {
    Name = "lab-monitor"
  }
  provisioner "file" {
    source      = "script/install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "bash /tmp/install.sh"
    ]
  }
  provisioner "file" {
    source      = "script/app.sh"
    destination = "/tmp/app.sh"
  }  
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/app.sh",
      "bash /tmp/app.sh"
    ]
  }  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${file("${var.PATH_TO_KEY}")}"
    host     = self.public_dns
  }
}
