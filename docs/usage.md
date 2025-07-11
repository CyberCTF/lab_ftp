# Guide d'utilisation FTP

## Connexion au serveur FTP

### Connexion basique
```bash
ftp localhost 21
```

### Connexion avec credentials
```bash
ftp -n
open localhost 21
user ctf ctf_password_2024
```

## Commandes FTP essentielles

### Navigation
- `ls` ou `dir` : Lister les fichiers du répertoire courant
- `cd <répertoire>` : Changer de répertoire
- `pwd` : Afficher le répertoire courant
- `cdup` : Remonter au répertoire parent

### Transfert de fichiers
- `get <fichier>` : Télécharger un fichier depuis le serveur
- `put <fichier>` : Envoyer un fichier vers le serveur
- `mget <pattern>` : Télécharger plusieurs fichiers (avec wildcards)
- `mput <pattern>` : Envoyer plusieurs fichiers (avec wildcards)

### Modes de transfert
- `ascii` : Mode texte (pour les fichiers texte)
- `binary` : Mode binaire (pour les fichiers binaires)
- `passive` : Activer le mode passif (recommandé)

### Informations
- `status` : Afficher l'état de la connexion
- `system` : Afficher le type de système du serveur
- `size <fichier>` : Obtenir la taille d'un fichier

### Contrôle de session
- `quit` ou `bye` : Quitter le client FTP
- `disconnect` : Déconnecter sans quitter le client

## Exemple de session complète

```bash
$ ftp localhost 21
Connected to localhost.
220 Welcome to CTF FTP Lab Server
Name (localhost:user): ctf
331 Please specify the password.
Password: ctf_password_2024
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.

ftp> ls
200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
drwxr-xr-x    2 ctf      ctf          4096 Jan 01 12:00 public
226 Directory send OK.

ftp> cd public
250 Directory successfully changed.

ftp> ls
200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
-rw-r--r--    1 ctf      ctf            25 Jan 01 12:00 welcome.txt
-rw-r--r--    1 ctf      ctf            38 Jan 01 12:00 test.txt
-rw-r--r--    1 ctf      ctf            32 Jan 01 12:00 flag.txt
226 Directory send OK.

ftp> get flag.txt
200 PORT command successful. Consider using PASV.
150 Opening BINARY mode data connection for flag.txt (32 bytes).
226 Transfer complete.
32 bytes received in 0.00 secs (32000.00 kB/s)

ftp> quit
221 Goodbye.
```

## Dépannage

### Problème de mode passif
Si vous rencontrez des erreurs de connexion, essayez :
```bash
ftp> passive
Passive mode on.
```

### Problème de permissions
Vérifiez que vous êtes dans le bon répertoire et que vous avez les permissions nécessaires.

### Timeout de connexion
Ajustez les paramètres de timeout si nécessaire dans la configuration du serveur. 