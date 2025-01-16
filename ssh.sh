#!/bin/bash

# Define SSH creation API or endpoint
API_URL="https://www.fastssh.com/create-ssh-account"
COUNTRY="Singapore"  # Replace with desired country
USERNAME="user$(date +%s)"
PASSWORD="password123"

# Automate account creation
RESPONSE=$(curl -s -X POST \
  -d "username=$USERNAME&password=$PASSWORD&country=$COUNTRY" \
  "$API_URL")

# Extract and display account details
if [[ $RESPONSE == *"success"* ]]; then
  echo "SSH Account Created Successfully!"
  echo "Host: $(echo $RESPONSE | jq -r '.host')"
  echo "Username: $USERNAME"
  echo "Password: $PASSWORD"
else
  echo "Failed to create SSH account. Check API or script."
fi
