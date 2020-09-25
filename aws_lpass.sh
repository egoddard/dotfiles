#!/bin/bash

# based on https://paulgalow.com/securing-aws-credentials-macos-lastpass
#
readonly lastPassEntry="$1/aws_credentials"
readonly accessKeyId=$(lpass show --username "$lastPassEntry")
readonly secretAccessKey=$(lpass show --password "$lastPassEntry")

# Create JSON object that AWS CLI expects
jq -n \
    --arg accessKeyId "$accessKeyId" \
    --arg secretAccessKey "$secretAccessKey" \
    '.Version = 1
    | .AccessKeyId = $accessKeyId
    | .SecretAccessKey = $secretAccessKey'
