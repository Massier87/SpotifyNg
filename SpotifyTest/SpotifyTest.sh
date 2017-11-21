#!/bin/bash

# spotify_platform_oauth_client_credentials.sh
#
# A script to quickly and easily generate Spotify oauth "Client Credentials" tokens given a client
# id and secret.
# Based on an original gist by hughrawlinson: https://gist.github.com/hughrawlinson/1d24595d3648d53440552436dc215d90

# IMPORTANT: Add your client id and client secret here:
client_id=07fabbb46cf848caa751960e30ff27e7
client_secret=0a28ae3625c340b4bd3ffd12edc2e285

# I am sorry about this sed. OS X base64 is different to python base64 I guess // hughrawlinson
response=$(curl -s https://accounts.spotify.com/api/token \
  -H "Content-Type:application/x-www-form-urlencoded" \
  -H "Authorization: Basic $(echo $client_id:$client_secret | base64 | sed 's/K$/=/')" \
  -d "grant_type=client_credentials")

# Requires jq for pretty printing. You can either install it, or just echo $response
echo $response 