# Awesome-Installer
This repository provides a ready-to-run setup script to install all essential bug bounty recon tools on a fresh Debian/Ubuntu system. It handles all dependencies, including dynamic installation of tools whose versions change frequently, like Feroxbuster, and ensures your machine is fully equipped for recon automation.

# **Tools will Install**

- **subfinder**	- Passive subdomain enumeration </br>
- **assetfinder**	- Subdomain enumeration via public sources</br>
- **amass**	- Advanced subdomain enumeration & network mapping</br>
- **httpx**	- Check live hosts, probe web servers</br>
- **naabu**	- Fast port scanning</br>
- **nmap**	- Port scanning and service fingerprinting</br>
- **nuclei** - Vulnerability scanning using templates</br>
- **feroxbuster**	- Directory & file brute-forcing</br>
- **gobuster** - Alternative directory & subdomain brute-force</br>
- **gau**	- Fetch URLs from archives (Wayback Machine, CommonCrawl)</br>
- **waybackurls** -	Historical URL discovery</br>
- **gf + patterns** -	Filter URLs for XSS, SQLi, LFI, SSRF, etc.</br>
- **gowitness** - Take screenshots of live web hosts</br>
- **dalfox**	- Automated XSS testing</br>
- **sqlmap** -	Automated SQL injection testing</br>
- **commix** -	Command injection testing</br>

# Installation

**Clone the repository:**

```
git clone https://github.com/ninja-jsi/Awesome-Installer.git
cd Awesome-Installer
```

#**Run the setup script:**

```
chmod +x tools-installation.sh
./tools-installation.sh
```

**Add Go binaries to your PATH:**

```
export PATH=$PATH:$(go env GOPATH)/bin
```
Add this line to ~/.bashrc to persist across sessions if needed.


# Notes

- The script dynamically installs the latest version of Feroxbuster and other Go-based tools.</br>
- Installs all required dependencies (libpcap-dev, build-essential, jq, python3-pip, etc.).</br>
- Designed for fresh Debian/Ubuntu installs.</br>
- Use only on authorized systems.</br>
