#!/bin/bash

# When you are ssh into the virtual machine run these commands:

sudo apt update

sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

Install ansible repository
 sudo apt-add-repository ppa:ansible/ansible
    
sudo apt update
 
install ansible 
> sudo DEBIAN_FRONTEND=noninteractive apt install ansible -y


# cd into the .ssh in the home directory and do
nano <"aws-private-key-name-including-.pem">
# paste the private key you downloaded from AWS when you created the key pair
#into the nano editor and save it.

#then run this command to set the correct permissions on the private key file
chmod 400 <"aws-private-key-name-including-.pem">

# then we can cd into the app-target node instance with 
ssh -i "aws-private-key-name-including-.pem" ubuntu@"app-node-private-ip-address"

#then you will be logged into the app-node instance

#login to app
app-instance ansible_host=172.31.56.26 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/tech515-oliver-aws.pem
#login to db
db-instance ansible_host=172.31.56.26 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/tech515-oliver-aws.pem

ansible-inventory --list

ansible web -m ping

ansible web -a "uname -a"
ansible web -a "date"



#always use modules if can as they are idempotent

#if theres nothing as a backup use the 
bash commands or
shell module is not idempotent 

# how to make an apt update using ansible module
ansible all -m apt -a "update_cache=yes" --become
ansible all -m apt -a "upgrade=dist" --become




# just use copy 
ansible web -m copy -a "src=~/.ssh/tech515-oliver-aws.pem dest=/home/ubuntu/.ssh/tech515-oliver-aws.pem mode=0400 owner=ubuntu group=ubuntu" --become

#to check to see if it copied over
ansible web -a "ls -l "ls -l .ssh""

