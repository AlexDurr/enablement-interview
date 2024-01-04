#!/bin/bash

# This script assumes it will be executed with sufficient permissions to write to '/root/.bash_profile'
# Running the script with the "sudo" command will be neccessary if run as a regular user
# Created with assistance from ChatGPT 3.5


# Default values
DEFAULT_USERNAME="AlexDurr"
DEFAULT_HOSTNAME="vault-server.hashicorp.com"

# Function to display usage information
usage() {
    echo "Usage: $0 -u <username> -v <vault_host>"
    echo "  -u    GitHub username (optional, default: $DEFAULT_USERNAME)"
    echo "  -v    Vault server hostname (optional, default: $DEFAULT_HOSTNAME)"
    echo "  -help Display this help message"
    exit 1
}

# Set default values
USERNAME=$DEFAULT_USERNAME
HOSTNAME=$DEFAULT_HOSTNAME

# Parse command line options
while getopts ":u:v:h" opt; do
    case $opt in
        u) USERNAME="$OPTARG" ;;
        v) HOSTNAME="$OPTARG" ;;
        h) usage ;;
        \?) echo "Invalid option: -$OPTARG" >&2; usage ;;
        :)  echo "Option -$OPTARG requires an argument." >&2; usage ;;
    esac
done

# Create /root/.bash_profile if it doesn't exist
if [ ! -e /root/.bash_profile ]; then
    touch /root/.bash_profile
fi

# Check if the username already exists in /root/.bash_profile
if sudo grep -q "GITHUB_USERNAME=" /root/.bash_profile; then
    sudo sed -i "s/GITHUB_USERNAME=.*$/GITHUB_USERNAME=\"$USERNAME\"/" /root/.bash_profile
else
    echo "export GITHUB_USERNAME=\"$USERNAME\"" | sudo tee -a /root/.bash_profile > /dev/null
fi

# Write configuration to config.hcl
cat <<EOF > config.hcl
cluster_addr  = "https://$HOSTNAME:8201"
api_addr      = "https://$HOSTNAME:8200"
disable_mlock = true
EOF

echo "Setup complete!"
