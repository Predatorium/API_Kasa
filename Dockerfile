FROM node:20-bookworm

WORKDIR /app

# Outils nécessaires pour compiler sqlite3
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Copie des manifests
COPY package*.json ./

# Install des dépendances + rebuild sqlite3
RUN npm ci --only=production && npm rebuild sqlite3

# Copie du code
COPY . .

# Port par défaut (adapte si ton app écoute sur un autre port)
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "start"]