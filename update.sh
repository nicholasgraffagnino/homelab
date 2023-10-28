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

# Update apt source list and upgrade all packages
apt update -y && apt full-upgrade -y && apt autoremove -y && apt clean -y && apt autoclean -y
