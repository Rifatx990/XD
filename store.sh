#!/bin/bash

# Define variables
BASE_URL="https://sshstores.net"
CREATE_URL="$BASE_URL/create-ssh-account"  # Adjust based on the site's actual URL
USERNAME="user$(date +%s)"  # Generate unique username
PASSWORD="password123"      # Set your desired password
COUNTRY="Singapore"         # Choose server location (adjust as needed)

# Simulate account creation
RESPONSE=$(curl -s -X POST \
  -d "username=$USERNAME&password=$PASSWORD&country=$COUNTRY" \
  "$CREATE_URL")

# Check response and extract details
if [[ $RESPONSE == *"Account created successfully"* ]]; then
  echo "SSH Account Created Successfully!"
  echo "Username: $USERNAME"
  echo "Password: $PASSWORD"
  echo "Server: $(echo $RESPONSE | jq -r '.server')"
  echo "Port: $(echo $RESPONSE | jq -r '.port')"
else
  echo "Failed to create SSH account. Please check the website or script."
fi
