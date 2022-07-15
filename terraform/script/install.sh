#!/bin/bash

instalaPKG () {
    echo "Instalando pacotes essenciais"
    sudo yum install -y docker git
    sudo amazon-linux-extras install -y ansible2
    echo "Checando instalações"
    git version
    ansible --version
    echo "Ajustando instalação do Docker"
    sudo usermod -a -G docker ec2-user
    id ec2-user
    #newgrp docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo docker version

}
instalaDockerCompose () {
    echo "Instalando docker-compose"
    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Verificando instalação do docker-compose"
    docker-compose version
}

instalaPKG
instalaDockerCompose