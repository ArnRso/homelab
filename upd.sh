#!/bin/bash

# Définir le dossier de recherche
dossier_recherche="$HOME/docker"

# Rechercher tous les fichiers "compose.yaml" à un niveau de profondeur
fichiers_compose=$(find "$dossier_recherche" -maxdepth 2 -name "compose.yaml")

# Parcourir chaque fichier trouvé
for fichier in $fichiers_compose; do
  # Accéder au dossier du fichier
  cd "$(dirname "$fichier")"

  # Lancer "docker compose up -d"
  docker-compose up -d

  # Afficher un message de confirmation
  echo "** 'docker compose up -d' a été exécuté dans le dossier $(pwd) **"
done