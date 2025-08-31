# Awesome-Installer
This repository provides a ready-to-run setup script to install all essential bug bounty recon tools on a fresh Debian/Ubuntu system. It handles all dependencies, including dynamic installation of tools whose versions change frequently, like Feroxbuster, and ensures your machine is fully equipped for recon automation with updated golang version.

# **Tools will Install**

- **Subfinder**	- Passive subdomain enumeration </br>
- **Assetfinder**	- Subdomain enumeration via public sources</br>
- **FFUF** – Directory/file fuzzing</br>
- **Hakrawler** – Quick web crawling</br>
- **Amass**	- Advanced subdomain enumeration & network mapping</br>
- **Httpx**	- Check live hosts, probe web servers</br>
- **Gowitness**	- Screenshot web apps / hosts</br>
- **Corsy / CorsScanner**	– CORS misconfig scanning</br>
- **Naabu**	- Fast port scanning</br>
- **Nmap**	- Port scanning and service fingerprinting</br>
- **Nuclei** - Vulnerability scanning using templates</br>
- **Subjack / Subzy / Aquatone** – Subdomain takeover checks</br>
- **Feroxbuster**	- Directory & file brute-forcing</br>
- **JQ / HTTPie / MassDNS** – Parsing / DNS brute-forcing</br>
- **Gobuster** - Alternative directory & subdomain brute-force</br>
- **Gau**	- Fetch URLs from archives (Wayback Machine, CommonCrawl)</br>
- **Waybackurls** -	Historical URL discovery</br>
- **Gf + patterns** -	Filter URLs for XSS, SQLi, LFI, SSRF, etc.</br>
- **Dalfox**	- Automated XSS testing</br>
- **SQLmap** -	Automated SQL injection testing</br>
- **Commix** -	Command injection testing</br>
- **Anubis / ParamSpider** -	Parameter discovery</br>
- **LinkFinder** -	JS endpoint discovery</br>

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
