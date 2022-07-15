#!/bin/bash

importRepoGrafana () {
    sudo chmod 777 /opt -R
    mkdir /opt/repos
    pushd /opt/repos && git clone https://github.com/Einsteinish/Docker-Compose-Prometheus-and-Grafana.git && popd
    pushd /opt/repos/Docker-Compose-Prometheus-and-Grafana && docker-compose -f docker-compose.yml up -d
}

importRepoGrafana