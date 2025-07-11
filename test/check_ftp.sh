#!/bin/bash

# Script de test pour vérifier la connexion FTP

FTP_HOST="localhost"
FTP_PORT="21"
FTP_USER="ctf"
FTP_PASSWORD="ctf_password_2024"

echo "=== Test de connexion FTP ==="
echo "Host: $FTP_HOST:$FTP_PORT"
echo "User: $FTP_USER"
echo ""

# Test de connexion et commandes de base
echo "Test 1: Connexion et listing"
ftp -n <<EOF
open $FTP_HOST $FTP_PORT
user $FTP_USER $FTP_PASSWORD
ls
quit
EOF

echo ""
echo "Test 2: Téléchargement d'un fichier"
ftp -n <<EOF
open $FTP_HOST $FTP_PORT
user $FTP_USER $FTP_PASSWORD
cd public
get welcome.txt
quit
EOF

if [ -f "welcome.txt" ]; then
    echo "✓ Téléchargement réussi:"
    cat welcome.txt
    rm welcome.txt
else
    echo "✗ Échec du téléchargement"
fi

echo ""
echo "Test 3: Création et upload d'un fichier"
echo "Test file created by check_ftp.sh" > test_upload.txt
ftp -n <<EOF
open $FTP_HOST $FTP_PORT
user $FTP_USER $FTP_PASSWORD
put test_upload.txt
quit
EOF

if [ $? -eq 0 ]; then
    echo "✓ Upload réussi"
    rm test_upload.txt
else
    echo "✗ Échec de l'upload"
fi

echo ""
echo "=== Fin des tests ===" 