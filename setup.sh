#!/bin/bash

HOST_ADDRESS="vault-server.hashicorp.com"
GITHUB_USERNAME="AlexDurr"

#ChatGPT Output below 
#TODO Test & Refine


# Set environment variable in /root/.bash_profile
echo 'export GITHUB_USERNAME="your_github_username"' >> /root/.bash_profile

# Write configuration to config.hcl
cat <<EOF > config.hcl
cluster_addr  = "https://<HOSTNAME>:8201"
api_addr      = "https://<HOSTNAME>:8200"
disable_mlock = true
EOF

# Replace <HOSTNAME> in config.hcl
sed -i 's/<HOSTNAME>/vault-server.hashicorp.com/g' config.hcl

echo "Setup complete!"

