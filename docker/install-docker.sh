#!/bin/bash

set -e

echo "🛠 Atualizando pacotes e instalando dependências..."

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "📁 Criando diretório para chave do Docker..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "🔑 Baixando chave GPG oficial do Docker..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "➕ Adicionando repositório do Docker ao APT..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Atualizando lista de pacotes..."
sudo apt-get update

echo "📦 Instalando Docker e plugins..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker instalado com sucesso!"
docker --version

echo "✅ Docker Compose instalado com sucesso!"
docker compose --version

echo "👤 Adicionando o usuário '$USER' ao grupo 'docker'..."
sudo usermod -aG docker "$USER"

echo "⚠️  ATENÇÃO: você precisa sair e entrar novamente (ou executar 'newgrp docker') para aplicar a permissão."
