resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  security_groups = ["launch-wizard-1"]
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
  }
  key_name = data.aws_key_pair.example.key_name
  user_data = data.template_file.init.rendered
  tags = {
    Name = "lab-monitor"
  }
}
