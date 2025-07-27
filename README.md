# 🚀 Instalação do Docker e Docker Compose (Ubuntu)

Este script instala automaticamente o **Docker Engine**, **Docker Compose Plugin** e todas as dependências necessárias em sistemas Ubuntu (recomendado para 20.04+).

---

## 📦 O que este script faz

- Atualiza pacotes do sistema
- Adiciona o repositório oficial do Docker
- Instala:
  - `docker-ce`
  - `docker-ce-cli`
  - `containerd.io`
  - `docker-buildx-plugin`
  - `docker-compose-plugin`
- Adiciona o usuário atual ao grupo `docker` (para uso sem `sudo`)

---

## 🧪 Requisitos

- Ubuntu 20.04, 22.04 ou superior
- Permissões de `sudo`

---

## 🔧 Instalação automática via terminal

Execute o comando abaixo em seu terminal para instalar tudo automaticamente:

```bash
curl -fsSL https://raw.githubusercontent.com/david-byte/devops/refs/tags/v1.0.1/docker/install-docker.sh | sudo bash
