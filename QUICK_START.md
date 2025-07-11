# FTP Anonymous Login Vulnerability Lab - Quick Start

## 🚀 Quick Setup

### Prerequisites
- Docker and Docker Compose installed
- Port 21 available on your system
- Basic knowledge of FTP commands

### 1. Start the Lab
```bash
# Navigate to the deploy directory
cd deploy

# Start the vulnerable FTP server
docker-compose up -d

# Check if it's running
docker-compose ps
```

### 2. Test the Vulnerability
```bash
# Navigate to the test directory
cd ../test

# Make the exploit script executable
chmod +x exploit_ftp_anonymous.sh

# Run the exploitation demonstration
./exploit_ftp_anonymous.sh
```

### 3. Manual Testing
```bash
# Connect to the FTP server
ftp localhost 21

# Login with anonymous credentials
Username: anonymous
Password: (leave blank)

# Or try these credentials
Username: ftp
Password: ftp
```

## 📋 Available Files for Exploitation

The lab includes these sensitive files to demonstrate the vulnerability:

- **`/public/flag.txt`** - CTF flag
- **`/config/database.conf`** - Database credentials
- **`/config/smtp.conf`** - SMTP credentials  
- **`/backups/db_backup.sql`** - Database backup
- **`/logs/server.log`** - Server logs

## 🔍 FTP Commands to Try

```bash
# List files and directories
ls
dir

# Change directory
cd public
cd config
cd backups
cd logs

# Download files
get flag.txt
get database.conf
get smtp.conf
get db_backup.sql
get server.log

# View file contents (if supported)
cat database.conf

# Navigate back
cd ..

# Quit
quit
```

## 🛡️ Understanding the Vulnerability

### What Makes This Vulnerable?
- Anonymous access enabled (`anonymous_enable=YES`)
- Sensitive files accessible without authentication
- No access controls on directories
- Cleartext credentials in configuration files

### Real-World Impact
- Information disclosure
- Credential harvesting
- Database access potential
- Lateral movement opportunities

## 📚 Learning Objectives

After completing this lab, you should understand:

1. **How FTP anonymous login works**
2. **Why it's dangerous in production**
3. **What sensitive information can be exposed**
4. **How to detect this vulnerability**
5. **How to mitigate the risk**

## 🧹 Cleanup

```bash
# Stop the lab
cd deploy
docker-compose down

# Remove all data
docker-compose down -v
docker image prune -f
```

## 📖 Additional Resources

- **Documentation**: `docs/ftp_anonymous_vulnerability.md`
- **Exploit Script**: `test/exploit_ftp_anonymous.sh`
- **Docker Config**: `deploy/docker-compose.yml`

## ⚠️ Important Notes

- This lab is for **educational purposes only**
- **Never** use this configuration in production
- Always obtain proper authorization before testing
- The vulnerability is intentionally enabled for demonstration

## 🎯 Next Steps

1. **Read the full documentation** in `docs/ftp_anonymous_vulnerability.md`
2. **Try different exploitation techniques**
3. **Practice manual testing methods**
4. **Learn about mitigation strategies**
5. **Explore other FTP vulnerabilities**

---

**Happy Learning! 🎓** 