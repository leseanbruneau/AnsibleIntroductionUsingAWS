#!/bin/bash

newEC2web1=$(aws ec2 run-instances --image-id <REPLACE_WITH_LATEST_AMAZON_AMI> --count 1 --instance-type t2.micro \
--key-name <REPLACE_WITH_YOUR_KEYNAME> --security-group-ids <REPLACE_WITH_YOUR_DEFAULT_VPC_SECURITY_GROUP_ID> \
--subnet-id <REPLACE_WITH_YOUR_DEFAULT_VPC_SUBNET_ID> --region us-east-1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web-Server1}]' \
| jq -r .'Instances[0].InstanceId')

echo 'Waiting for new EC2 web server 1 instance to start...'
echo $newEC2web1

for i in "$newEC2web1"
do 
  aws ec2 wait instance-running --instance-ids $i
done

echo '[web-servers]' > ~/AnsibleIntroductionUsingAWS/hosts

web1Ip=$(aws ec2 describe-instances --instance-ids $newEC2web1 | jq -r .'Reservations[0].Instances[0].PublicIpAddress')

echo "web1 ansible_host=$web1Ip ansible_user=ec2-user" >> ~/AnsibleIntroductionUsingAWS/hosts


newEC2web2=$(aws ec2 run-instances --image-id <REPLACE_WITH_LATEST_AMAZON_AMI> --count 1 --instance-type t2.micro \
--key-name <REPLACE_WITH_YOUR_KEYNAME> --security-group-ids <REPLACE_WITH_YOUR_DEFAULT_VPC_SECURITY_GROUP_ID> \
--subnet-id <REPLACE_WITH_YOUR_DEFAULT_VPC_SUBNET_ID> --region us-east-1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web-Server2}]' \
| jq -r .'Instances[0].InstanceId')

echo 'Waiting for new EC2 web server 2 instance to start...'
echo $newEC2web2

for i in "$newEC2web2"
do 
  aws ec2 wait instance-running --instance-ids $i
done

web2Ip=$(aws ec2 describe-instances --instance-ids $newEC2web2 | jq -r .'Reservations[0].Instances[0].PublicIpAddress')

echo "web2 ansible_host=$web2Ip ansible_user=ec2-user" >> ~/AnsibleIntroductionUsingAWS/hosts


newEC2db1=$(aws ec2 run-instances --image-id <REPLACE_WITH_LATEST_AMAZON_AMI> --count 1 --instance-type t2.micro \
--key-name <REPLACE_WITH_YOUR_KEYNAME> --security-group-ids <REPLACE_WITH_YOUR_DEFAULT_VPC_SECURITY_GROUP_ID> \
--subnet-id <REPLACE_WITH_YOUR_DEFAULT_VPC_SUBNET_ID> --region us-east-1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DB-Server1}]' \
| jq -r .'Instances[0].InstanceId')

echo 'Waiting for new EC2 database server 1 instance to start...'
echo $newEC2db1

for i in "$newEC2db1"
do 
  aws ec2 wait instance-running --instance-ids $i
done

echo '' >> ~/AnsibleIntroductionUsingAWS/hosts
echo '[database-servers]' >> ~/AnsibleIntroductionUsingAWS/hosts

db1Ip=$(aws ec2 describe-instances --instance-ids $newEC2db1 | jq -r .'Reservations[0].Instances[0].PublicIpAddress')

echo "db1 ansible_host=$db1Ip ansible_user=ec2-user" >> ~/AnsibleIntroductionUsingAWS/hosts


newEC2db2=$(aws ec2 run-instances --image-id <REPLACE_WITH_LATEST_AMAZON_AMI> --count 1 --instance-type t2.micro \
--key-name <REPLACE_WITH_YOUR_KEYNAME> --security-group-ids <REPLACE_WITH_YOUR_DEFAULT_VPC_SECURITY_GROUP_ID> \
--subnet-id <REPLACE_WITH_YOUR_DEFAULT_VPC_SUBNET_ID> --region us-east-1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DB-Server2}]' \
| jq -r .'Instances[0].InstanceId')

echo 'Waiting for new EC2 database server 2 instance to start...'
echo $newEC2db2

for i in "$newEC2db2"
do 
  aws ec2 wait instance-running --instance-ids $i
done

db2Ip=$(aws ec2 describe-instances --instance-ids $newEC2db2 | jq -r .'Reservations[0].Instances[0].PublicIpAddress')

echo "db2 ansible_host=$db2Ip ansible_user=ec2-user" >> ~/AnsibleIntroductionUsingAWS/hosts


