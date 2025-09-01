#!/bin/bash
# Colors
RESET="\e[0m"
GREEN="\e[92m"
DARKGREEN="\e[32m"
GRAY="\e[90m"

BANNER="
      █████╗ ██╗    ██╗███████╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
     ██╔══██╗██║    ██║██╔════╝██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
     ███████║██║ █╗ ██║█████╗  ███████╗█████╗  ██║   ██║██╔████╔██║█████╗
     ██╔══██║██║███╗██║██╔══╝  ╚════██║██╔══╝  ██║   ██║██║╚██╔╝██║██╔══╝
     ██║  ██║╚███╔███╔╝███████╗███████║███████╗╚██████╔╝██║ ╚═╝ ██║███████╗
     ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

                         A W E S O M E   –   T O O L S
"

echo -e "${DARKGREEN}${BANNER}${RESET}"
echo -e "${GRAY}A curated set of recon, automation & security scripts.${RESET}"

# -----------------------------
# Bug Bounty Recon Tools Installer
# Works on Debian/Ubuntu
# -----------------------------

echo -e "\e[1;34m[+] Updating system...\e[0m"
sudo apt update && sudo apt upgrade -y

echo -e "\e[1;34m[+] Installing Golang...\e[0m"
wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
sudo tar -xzf go1.23.6.linux-amd64.tar.gz
rm go1.23.6.linux-amd64.tar.gz
mv go /usr/local

echo -e "\e[1;34m[+] Setting up Go PATH...\e[0m"
if ! grep -q "GOPATH" ~/.bashrc; then
    echo "export GOPATH=\$HOME/go" >> ~/.bashrc
    echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
    echo "export PATH=\$PATH:/usr/local" >> ~/.bashrc
    source ~/.bashrc
fi

echo -e "\e[1;34m[+] Installing basic dependencies...\e[0m"
sudo apt install -y curl wget libpcap-dev build-essential unzip python3 python3-pip commix sqlmap gobuster theharvester nmap 
sudo apt install -y jq httpie chromium

echo -e "\e[1;34m[+] Installing ProjectDiscovery tools...\e[0m"
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/ffuf/ffuf/v2@latest
go install github.com/projectdiscovery/subzy/cmd/subzy@latest

echo -e "\e[1;34m[+] Installing Assetfinder, Amass, Gau, Dalfox, Gf...\e[0m"

go install github.com/tomnomnom/assetfinder@latest
go install github.com/owasp-amass/amass/v5/cmd/amass@main
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/gf@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/devanshbatham/ParamSpider/cmd/ParamSpider@latest
go install github.com/sensepost/gowitness@latest
go install github.com/chenjj/Corsy@latest
go install github.com/haccer/subjack@latest
go install github.com/michenriksen/aquatone@latest

pip3 install linkfinder
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
echo -e "\e[1;34m[+] To Use MassDNS ./bin/massdns...\e[0m"

echo -e "\e[1;34m[+] Installing Feroxbuster...\e[0m"
echo -e "\e[1;34m[+] Installing latest Feroxbuster...\e[0m"
# Get latest release URL for Linux .deb
curl -sLO https://github.com/epi052/feroxbuster/releases/latest/download/feroxbuster_amd64.deb.zip
unzip feroxbuster_amd64.deb.zip
sudo apt install ./feroxbuster_*_amd64.deb

# Install the downloaded .deb
DEB_FILE=$(basename $FEROX_URL)
sudo apt install -y ./$DEB_FILE

# Clean up
rm -f $DEB_FILE

echo -e "\e[1;34m[+] Feroxbuster installed!\e[0m"

echo -e "\e[1;34m[+] Setting up GF patterns...\e[0m"
if [ ! -d ~/.gf ]; then
    mkdir -p ~/.gf
    git clone https://github.com/1ndianl33t/Gf-Patterns ~/Gf-Patterns
    cp -r ~/Gf-Patterns/*.json ~/.gf/
    rm -rf ~/Gf-Patterns
fi

echo -e "\e[1;34m[+] Installation complete!\e[0m"
echo -e "\e[1;34mEnsure Go binaries are in PATH: $(go env GOPATH)/bin\e[0m"
echo -e "\e[1;34mYou may need to restart terminal or run: source ~/.bashrc\e[0m"
