resource "aws_security_group" "default" {
  name        = "lab-monitor-ec2-security-group-instance"
  description = "Grupo de seguranca do EC2"

  # Acesso SSH de qualquer um
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Acesso HTTP de qualquer um
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Acesso HTTPS de qualquer um
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Acesso Grafana de qualquer um
  ingress {
    description = "Grafana access"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Acesso Prometheus de qualquer um
  ingress {
    description = "Prometheus access"
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  # Acesso de saida para internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "lab-monitor"
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  security_groups = ["${aws_security_group.default.name}"]
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
