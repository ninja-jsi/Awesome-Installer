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

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing basic dependencies..."
sudo apt install -y git curl wget libpcap-dev build-essential golang unzip python3 python3-pip commix sqlmap gobuster theharvester nmap

echo "[+] Setting up Go PATH..."
if ! grep -q "GOPATH" ~/.bashrc; then
    echo "export GOPATH=\$HOME/go" >> ~/.bashrc
    echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
    source ~/.bashrc
fi

echo "[+] Installing ProjectDiscovery tools..."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

echo "[+] Installing Assetfinder, Amass, Gau, Dalfox, Gf..."

go install github.com/tomnomnom/assetfinder@latest
go install github.com/owasp-amass/amass/v5/cmd/amass@main
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/gf@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/tomnomnom/httprobe@latest

echo "[+] Installing Feroxbuster..."
echo "[+] Installing latest Feroxbuster..."
# Get latest release URL for Linux .deb
FEROX_URL=$(curl -s https://api.github.com/repos/epi052/feroxbuster/releases/latest \
  | grep "browser_download_url" \
  | grep "amd64.deb" \
  | cut -d '"' -f 4)

echo "[+] Downloading: $FEROX_URL"
curl -sLO $FEROX_URL

# Install the downloaded .deb
DEB_FILE=$(basename $FEROX_URL)
sudo apt install -y ./$DEB_FILE

# Clean up
rm -f $DEB_FILE

echo "[+] Feroxbuster installed!"

echo "[+] Setting up GF patterns..."
if [ ! -d ~/.gf ]; then
    mkdir -p ~/.gf
    git clone https://github.com/1ndianl33t/Gf-Patterns ~/Gf-Patterns
    cp -r ~/Gf-Patterns/*.json ~/.gf/
    rm -rf ~/Gf-Patterns
fi

echo "[+] Installation complete!"
echo "Ensure Go binaries are in PATH: $(go env GOPATH)/bin"
echo "You may need to restart terminal or run: source ~/.bashrc"
