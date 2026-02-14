# 🚀 KSP DMP Docker Server

Uma imagem Docker para criar e executar servidores do **Kerbal Space Program (KSP)** utilizando o mod **DarkMultiPlayer (DMP)**.

Este projeto permite subir servidores multiplayer do KSP de forma simples, isolada e portátil usando containers Docker.

---

## 🎮 Sobre o Projeto

Esta imagem:

* Cria automaticamente um servidor DMP
* Permite persistência de dados via volume
* Ajusta permissões automaticamente (PUID/PGID)
* Pode ser integrada com APIs (ex: dockerode)
* Pode ser usada em ambientes locais ou servidores dedicados

Ideal para automação, painéis de controle personalizados ou orquestração via Node.js.

---

## 📦 Imagem

A imagem é publicada no GitHub Container Registry (GHCR).

```bash
docker pull ghcr.io/joaosantos2007/ksp:latest
```

---

## 🛠️ Como Usar

### Executar com Docker

```bash
docker run -d \
  --name ksp-server \
  -p 6702:6702/udp \
  -e PUID=1000 \
  -e PGID=1000 \
  -v $(pwd)/data:/data \
  ghcr.io/<seu-usuario>/ksp-server:latest
```

---

## 📁 Persistência de Dados

O diretório `/data` é utilizado para armazenar:

* Configurações do servidor
* Saves
* Logs
* Arquivos do DMP

Monte um volume para evitar perda de dados.

---

## 🔐 Variáveis de Ambiente

| Variável | Descrição                          | Padrão |
| -------- | ---------------------------------- | ------ |
| `PUID`   | UID do usuário dentro do container | 1000   |
| `PGID`   | GID do grupo dentro do container   | 1000   |

Essas variáveis garantem que os arquivos criados no volume tenham as permissões corretas no host.

---

## ⚙️ Funcionamento Interno

No start do container:

1. Ajusta UID e GID do usuário interno
2. Corrige permissões do volume
3. Copia arquivos padrão do servidor
4. Executa o `DMPServer.exe` via Mono

O processo do servidor roda como usuário não-root.

---

## 🧠 Integração com API

Esta imagem foi pensada para integração com sistemas que gerenciam containers dinamicamente, como:

* APIs Node.js
* dockerode
* Painéis personalizados

---

## 🐳 Build Local

```bash
docker build -t ksp-dmp-server .
```

---

## 📄 Licença

Este projeto não inclui o jogo Kerbal Space Program.

Você deve possuir uma cópia legítima do jogo para utilizar o mod DarkMultiPlayer.

---

## ⭐ Contribuições

Pull requests são bem-vindos.

Se este projeto te ajudou, considere dar uma estrela ⭐ no repositório
