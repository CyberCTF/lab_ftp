# FTP Anonymous Login Vulnerability Lab

A comprehensive Docker-based lab environment for learning about FTP anonymous login vulnerabilities, demonstrating real-world attack scenarios, and practicing security assessment techniques.

## 🎯 Objective

This lab provides a vulnerable FTP environment for:
- Learning about FTP anonymous login vulnerabilities
- Practicing penetration testing techniques
- Understanding information disclosure risks
- Demonstrating real-world attack scenarios
- Learning security mitigation strategies

## 📁 Project Structure

```
├── build/                  # FTP server application files
│   ├── Dockerfile         # Docker image for vulnerable FTP server
│   ├── vsftpd.conf        # Vulnerable vsftpd configuration
│   └── setup.sh           # Startup script
├── deploy/                 # Deployment files
│   ├── docker-compose.yml # Docker Compose configuration
│   └── env.example        # Environment variables example
├── test/                   # Testing scripts
│   ├── check_ftp.sh       # Basic connection test
│   └── exploit_ftp_anonymous.sh # Vulnerability exploitation script
├── docs/                   # Documentation
│   ├── usage.md           # FTP commands guide
│   ├── credentials.md     # Credentials documentation
│   └── ftp_anonymous_vulnerability.md # Comprehensive vulnerability guide
├── README.md              # This file
├── QUICK_START.md         # Quick start guide
└── .gitignore             # Git ignore file
```

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose installed
- Port 21 and 21100-21110 available

### Installation and Setup

1. **Clone the repository**
```bash
git clone <repository-url>
cd template-ftp
```

2. **Configure environment (optional)**
```bash
cd deploy
cp env.example .env
# Modify .env if needed (especially PASV_ADDRESS)
```

3. **Build and start the vulnerable server**
```bash
docker-compose up -d
```

4. **Verify startup**
```bash
docker-compose logs -f
```

### Testing the Vulnerability

```bash
# Manual connection
ftp localhost 21
# Username: anonymous (or ftp)
# Password: (blank) or ftp

# Or use the automated exploit script
cd ../test
chmod +x exploit_ftp_anonymous.sh
./exploit_ftp_anonymous.sh
```

## 🔧 Configuration

### Default Credentials (Vulnerable)
- **Username** : `anonymous` (or blank)
- **Password** : (blank) or `anonymous`
- **Alternative** : `ftp` / `ftp`
- **Port** : `21`

### Vulnerable Files Available
- `/public/flag.txt` - CTF flag
- `/config/database.conf` - Database credentials
- `/config/smtp.conf` - SMTP credentials
- `/backups/db_backup.sql` - Database backup
- `/logs/server.log` - Server logs

### Ports utilisés
- **21** : Port FTP principal
- **21100-21110** : Ports pour mode passif

## 🛡️ Security (Intentionally Vulnerable)

### Vulnerability Features (For Educational Purposes)
- Anonymous access enabled (`anonymous_enable=YES`)
- Sensitive files accessible without authentication
- Database credentials in cleartext
- SMTP credentials exposed
- Server logs accessible
- Backup files available

### What Makes This Vulnerable
- No authentication required for file access
- Sensitive configuration files readable
- Database backups accessible
- Log files containing sensitive information
- No access controls implemented

## 📚 Usage

### Basic FTP Commands
See `docs/usage.md` for a complete guide to FTP commands.

### Quick Connection Test
```bash
ftp -n localhost 21
user anonymous
# Password: (leave blank)
ls
cd public
get flag.txt
quit
```

### Automated Exploitation
```bash
cd test
./exploit_ftp_anonymous.sh
```

## 🧪 Testing

### Automated Exploitation Script
```bash
cd test
./exploit_ftp_anonymous.sh
```

### Manual Testing Steps
1. Connect with anonymous credentials
2. Explore directory structure
3. Download sensitive files
4. Analyze exposed information
5. Document findings

## 🔄 Development

### Rebuild the Image
```bash
cd deploy
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

### Server Logs
```bash
docker-compose logs -f ftp-server
```

### Container Access
```bash
docker exec -it ftp-anonymous-vuln-lab /bin/bash
```

## 📋 Maintenance

### Stop the Server
```bash
cd deploy
docker-compose down
```

### Complete Cleanup
```bash
docker-compose down -v
docker image prune -f
```

### Backup Logs
```bash
docker cp ftp-anonymous-vuln-lab:/var/log/vsftpd.log ./logs/
```

## 🤝 Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## 📝 License

This project is licensed under the MIT License. See the LICENSE file for details.

## ⚠️ Warning

This lab is for **educational purposes only**. 
**NEVER** use this configuration in production.
The vulnerability is intentionally enabled for demonstration purposes.

## 📖 Additional Resources

- **Quick Start Guide**: `QUICK_START.md`
- **Vulnerability Documentation**: `docs/ftp_anonymous_vulnerability.md`
- **Exploitation Script**: `test/exploit_ftp_anonymous.sh` 