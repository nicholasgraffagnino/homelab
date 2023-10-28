# Check if this script was run as a non-root user
function is_root()
{
  if [[ ${EUID} -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
  fi
};
clear
echo "Checking if you are running as root..."
is_root

# Install Unifi Controller on Ubuntu 20.04
apt update -y
echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list
wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
apt update -y && apt install ca-certificates openjdk-8-jdk apt-transport-https unifi -y
apt clean
