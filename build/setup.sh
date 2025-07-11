#!/bin/bash

# Setup script for FTP anonymous login vulnerability lab

echo "=========================================="
echo "FTP Anonymous Login Vulnerability Lab"
echo "=========================================="
echo ""
echo "🚨 WARNING: This lab demonstrates a security vulnerability"
echo "   DO NOT use this configuration in production!"
echo ""

# Start vsftpd directly in foreground
echo "Starting FTP server..."

# Check if vsftpd is available
if ! command -v vsftpd &> /dev/null; then
    echo "❌ ERROR: vsftpd is not installed or not in PATH"
    exit 1
fi

# Check if configuration file exists
if [ ! -f /etc/vsftpd.conf ]; then
    echo "❌ ERROR: vsftpd configuration file not found"
    exit 1
fi

echo "✅ vsftpd configuration file found"

echo "✅ FTP server started successfully"
echo "Server is available on port 21"
echo ""
echo "📋 Connection Information:"
echo "   Host: localhost (or your Docker host IP)"
echo "   Port: 21"
echo "   Username: anonymous (or leave blank)"
echo "   Password: (leave blank)"
echo "   Or use: ftp / ftp"
echo ""
echo "🔍 Files available for demonstration:"
echo "   /public/flag.txt - CTF flag"
echo "   /config/database.conf - Database credentials"
echo "   /config/smtp.conf - SMTP credentials"
echo "   /backups/db_backup.sql - Database backup"
echo "   /logs/server.log - Server logs"
echo ""
echo "💡 Example commands:"
echo "   ftp localhost 21"
echo "   # Then login with: anonymous (or ftp) and blank password"
echo "   # Commands: ls, cd, get, put, quit"
echo ""
echo "=========================================="

# Start vsftpd (it will go to background)
/usr/sbin/vsftpd /etc/vsftpd.conf

# Keep the container alive
 tail -f /dev/null 