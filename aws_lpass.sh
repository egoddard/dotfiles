#!/bin/bash

# based on https://paulgalow.com/securing-aws-credentials-macos-lastpass
#
readonly aws_account=${1:-health}
readonly lastPassEntry="${aws_account}_aws_credentials"
readonly accessKeyId=$(lpass show --username "$lastPassEntry")
readonly secretAccessKey=$(lpass show --password "$lastPassEntry")

# Create JSON object that AWS CLI expects
jq -n \
    --arg accessKeyId "$accessKeyId" \
    --arg secretAccessKey "$secretAccessKey" \
    '.Version = 1
    | .AccessKeyId = $accessKeyId
    | .SecretAccessKey = $secretAccessKey'
