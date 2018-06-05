#!/bin/bash

# Simple script to update parameters in ans_setup_script.sh
# Input Parameters
#  $1 - Latest Amazon Linux AMI
#  $2 - Keyname for user's AWS ECS instances in US-EAST-1 Region
#  $3 - AWS User's Default VPC Security Group ID
#  $4 - AWS User's Default VPC Subnet ID (any one will do)

sed "s/<REPLACE_WITH_LATEST_AMAZON_AMI>/$1/g" -i ./ans_setup_script.sh

sed "s/<REPLACE_WITH_YOUR_KEYNAME>/$2/g" -i ./ans_setup_script.sh

sed "s/<REPLACE_WITH_YOUR_DEFAULT_VPC_SECURITY_GROUP_ID>/$3/g" -i ./ans_setup_script.sh

sed "s/<REPLACE_WITH_YOUR_DEFAULT_VPC_SUBNET_ID>/$4/g" -i ./ans_setup_script.sh

