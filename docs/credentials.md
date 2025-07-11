# Credentials CTF Lab

## Compte FTP par défaut

### Utilisateur CTF
- **Nom d'utilisateur** : `ctf`
- **Mot de passe** : `ctf_password_2024`
- **Répertoire home** : `/home/ctf/ftp`
- **Permissions** : Lecture/écriture dans le répertoire home

## Sécurité

### Restrictions appliquées
- Chroot activé : L'utilisateur ne peut pas sortir de son répertoire home
- Commandes désactivées : `DELE`, `MKD`, `RMD`, `RNFR`, `RNTO`
- Limite de connexions : 10 clients maximum, 2 par IP
- Timeout de session : 300 secondes d'inactivité

### Mode passif
- Ports utilisés : 21100-21110
- Adresse configurée : 127.0.0.1 (modifiable via PASV_ADDRESS)

## Modification des credentials

Pour changer les credentials par défaut, modifiez le Dockerfile :

```dockerfile
RUN echo "ctf:nouveau_mot_de_passe" | chpasswd
```

Puis reconstruisez l'image :
```bash
cd deploy
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## Attention

Ces credentials sont destinés uniquement à des fins d'apprentissage et de test CTF. 
**Ne jamais utiliser ces credentials en production.** 