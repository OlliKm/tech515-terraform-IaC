# how to setups the Hosts file
* read the linked page first in order to be able to move onto this 
[how to install asible](/scripts/install-ansible.md)

--- 
1. cd into the /etc/ansible/
2. once in that directory run 
> ls -l
1. this should show all the hidden folders inside ansible - there should be one called hosts 
2. you then want to Sudo nano into the hosts file
3. there should be nothing but comments in there at the top of the page you want to make your app and db reference 
4. we can do this by putting 
```

[web]
app-instance ansible_host=<app priv ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/aws_key_file_name.pem

[db]
db-instance ansible_host=<app priv ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/aws_key_file_name.pem
```