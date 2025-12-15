## Break down of my App and DB Yaml code

[link to original script](/scripts/both-app-db.yml)

## database break down:
```
 --- # every yaml script startes with 3 lines

 - name: install mongo db v7 # this is the playbook name/title
  hosts: db # this specifies which virtual machine you are wanting the script on 
```
  [click to view how to setup hosts](/scripts/setup=hosts.md)
```
  become: yes # same as telling it to run every command as Sudo on linux

  gather_facts: yes # collects system information at start of playbook

  tasks: # important to write tasks as this will be what commands are getting run

  - name: import Mongo DB public key # command name
    ansible.builtin.apt_key: # ansible function being used
      url: https://www.mongodb.org/static/pgp/server-7.0.asc # linking the url to the mongodb download 
      state: present # this is what state its in for this case present= running

  - name: Add the MongoDB repository # command name
    ansible.builtin.apt_repository: # ansible function

      repo: "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu {{ ansible_distribution_release }}/mongodb-org/7.0 multiverse"
      state: present
      update_cache: yes # makes modules run equivalent of an update before running
  
  - name: Install MongoDB 7.0.6 # command name
    ansible.builtin.apt: # ansible function
      name: mongodb-org=7.0.6 # name of task in function
      # this makes sure it is installed, but not running
      state: present # is present = is running 
      update_cache: yes

  - name: configure BindIp
    ansible.builtin.replace: # use the replace plugin 
      path: /etc/mongod.conf # where we want to replace the string text 
      regexp: 'bindIp: 127.0.0.1' # this is whats in the default conf
      replace: 'bindIp: 0.0.0.0' # this is what we say we want to replace the default conf option with 

  - name: restart mongodb
    ansible.builtin.service: # ansible function 
      name: mongod 
      state: restarted # allows the software to restart so we can access changes. 
```

## APP Script Breakdown

```

- name: install all app dependencies # name of the play

  hosts: web # tells us where to run the play

  environment: # sets a environment like a printenv environment from linux
    DB_HOST: "mongodb://172.31.56.26:27017/posts" # we put the db priv ip between the .// and the :27017

  gather_facts: yes  # get comprehensive facts  
 
  become: true  # provide super user access

  tasks: # a list of commands we want to run

  - name: update apt cache
    ansible.builtin.apt:
      update_cache: yes # makes sure we are updated on latest version 

  - name: upgrade all packages
    ansible.builtin.apt:
      upgrade: dist # makes sure all packages are upgraded to latest versions


  - name: install nginx
    apt: pkg=nginx state=present # install package and making it run as present

  - name: Update Nginx reverse proxy to point to Node app
    ansible.builtin.replace:
      path: /etc/nginx/sites-available/default # where the file we want it to go into so it can replace values
      regexp: 'try_files\s+\$uri\s+\$uri/ =404;' # what we want to replace
      replace: 'proxy_pass http://127.0.0.1:3000;' # what we want there instead

  - name: restart nginx
    ansible.builtin.service:
      name: nginx
      state: restarted # restarts nginx to allow us to view and access the updated values changed from the replacement command

  #install gpg key
  - name: install gpg key for nodejs
    apt_key: # installs the key for nodejs for a url link 
      url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
      state: present # is running

  #install nodejs 
  - name: Install Node.js (v20.x)
    ansible.builtin.shell: |
        curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash - # using a shell command to download and install nodejs from the web
    args: # passes named parameters to actions 
      creates: /etc/apt/sources.list.d/nodesource.list
  #node js package

  - name: Install NodeJS package
    apt:
      name: nodejs
      state: present # basic install the apt we downloaded
    
  - name: install PM2 globally
    ansible.builtin.npm: # installing pm2 to help with running of app
      name: pm2
      global: yes # want this to run wherever instead of just in a single folder

  # repo clone 
  - name: clone the github repo
    become: false # doesn't need sudo commands to run so disabled them 
    ansible.builtin.git: # using ansibles git function to call on a repo
      repo: 'https://github.com/OlliKm/tech515_sparta_app_to_clone.git' # linking the github repo we want to clone
      dest: /home/ubuntu/repo # setting the destination within the app vm and then creating a folder called repo to store it
      force: yes # makes this happen no matter what 
      update: yes # makes sure its on latest update


#npm install and run 
  - name: npm install
    become: false # doesn't need sudo commands
    npm:
      path: /home/ubuntu/repo/app # makes sure we are cd'd into the folder where the app is present
      state: present # is running

  - name: stop PM2
    become: false # doesn't need a sudo command to run so disabled so it
    command: pm2 stop all

  - name: start Node app with PM2
    become: false # doesn't need sudo otherwise it would be in root instead which wouldn't work 
    command: pm2 start app.js # telling the vm to run the command 
    args: # passing name parameters 
      chdir: /home/ubuntu/repo/app # makes sure we are in the repo/app folder before any of the commands above are run 

```




