# aws-lab-grafana
![alt text](img/lab.png "aws-lab-grafana")


Este repositório tem como objetivo criar uma EC2 na AWS com Docker para execução de uma instância de Grafana com Prometheus.

# Como usar

`git clone https://github.com/kduchagaslima/aws-lab-grafana.git`


```
cat ~/.aws/credentials

[default]
aws_access_key_id = <my_access_key_id>
aws_secret_access_key = <my_access_key>

```

Navegue até a pasta `terraform`

`cd aws-lab-grafana/terraform/`

Este repositório pode ser executado também pelo [Terraform Cloud](https://app.terraform.io/app), mas caso queira seguir com a versão CLI do [Terraform](https://www.terraform.io/docs) basta configurar as credencias e inicializar o backend:

```
terraform init 
terraform plan
terraform apply
```
> Lembre-se de criar uma key pair antes de provisionar a infraestrutura, após a key pair criada, ajuste o arquivo terraform/data.tf

```
data "aws_key_pair" "example" {
  key_name           = "demo-monitor" ## Informar o nome da chave que já tenha criado na conta
  include_public_key = true

}
```

Após finalizado, basta aguardar uns segundos para acessar as aplicações Grafana e Prometheus. 

http://ec2-instance-public-dns:3000 - Grafana

http://ec2-instance-public-dns:9090 - Prometheus