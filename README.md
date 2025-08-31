# Awesome-Installer
This repository provides a ready-to-run setup script to install all essential bug bounty recon tools on a fresh Debian/Ubuntu system. It handles all dependencies, including dynamic installation of tools whose versions change frequently, like Feroxbuster, and ensures your machine is fully equipped for recon automation.

🛠 Tools Installed

subfinder	- Passive subdomain enumeration
assetfinder	- Subdomain enumeration via public sources
amass	- Advanced subdomain enumeration & network mapping
httpx	- Check live hosts, probe web servers
naabu	- Fast port scanning
nmap	- Port scanning and service fingerprinting
nuclei - Vulnerability scanning using templates
feroxbuster	- Directory & file brute-forcing
gobuster - Alternative directory & subdomain brute-force
gau	- Fetch URLs from archives (Wayback Machine, CommonCrawl)
waybackurls -	Historical URL discovery
gf + patterns -	Filter URLs for XSS, SQLi, LFI, SSRF, etc.
gowitness	- Take screenshots of live web hosts
dalfox	- Automated XSS testing
sqlmap -	Automated SQL injection testing
commix -	Command injection testing

▶️ Installation

Clone the repository:

git clone <repo-url>
cd <repo-folder>

Run the setup script:

chmod +x setup-recon.sh
./setup-recon.sh

Add Go binaries to your PATH:

export PATH=$PATH:$(go env GOPATH)/bin

Add this line to ~/.bashrc to persist across sessions.


⚡ Notes

The script dynamically installs the latest version of Feroxbuster and other Go-based tools.
Installs all required dependencies (libpcap-dev, build-essential, jq, python3-pip, etc.).
Designed for fresh Debian/Ubuntu installs.
Use only on authorized systems.
