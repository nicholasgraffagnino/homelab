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

# Disable IPv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
