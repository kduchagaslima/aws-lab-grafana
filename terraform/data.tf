data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "description"

    values = [
      "Amazon Linux 2 Kernel 5.10 AMI 2.0.20220606.1 x86_64 HVM gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

data "aws_key_pair" "example" {
  key_name           = "demo-monitor" ## Informar o nome da chave que já tenha criado na conta
  include_public_key = true

}

data "template_file" "init" {
  template = file("${path.module}/script/init-setup.sh")
}