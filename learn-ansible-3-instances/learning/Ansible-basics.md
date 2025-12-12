# Ansible 

## intro to Ansible

### What is Ansible?
* A configuration Management tool
* Read-Hat leads development
* Open-Source
* Written in python
* started off with just a few core modules for managing and configuring linux servers 
* main use cases
  * config management ( keep software and software settings in the desired & consistent state)
* Works with almost any systems, including...
  * Window & Linux servers
  * routers & switches
  * cloud services 
  
<br>

### How does it work?
* If ansible = robot, then the recipe (actions/tasks) would be a playbook
  * playbooks are written in YAML
  * Use ansible control node (A controller) it configures target nodes.
  * Agentless
    * no need to install ansible on Target Nodes
    * Instead, Ansible controller will ssh into Target nodes to run commands 
  * On  linux Target Nodes a Interpreter is required.
  
![alt text](/IaC/Images/ansible-dg.png)

