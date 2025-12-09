# Iac

- [Iac](#iac)
  - [Links to Terraform and Ansible doc](#links-to-terraform-and-ansible-doc)
  - [what problems need solving?](#what-problems-need-solving)
  - [What have we auto so far?](#what-have-we-auto-so-far)
  - [How does IaC help?](#how-does-iac-help)
  - [Solving the Problems with IaC](#solving-the-problems-with-iac)
  - [What is IaC?](#what-is-iac)
  - [benefit of IaC?](#benefit-of-iac)
  - [Tools available for IaC](#tools-available-for-iac)


## Links to Terraform and Ansible doc

* [Link to terraform](/IaC/terraform/README.md)

## what problems need solving?

* At moment, still manually "provisioning" servers
  
  What is "Provisioning servers?
  * The process of setting up and configuring servers
1. the process typically involves:
 1. creating the server instance
  2. configure the OS + Software e.g.
     1. setting up users + permissions
     2. 
  3. deploy the application
  4. configure monitoring & logging


  
<br>

## What have we auto so far?
* VMs
  * creation of VM's?
    * Not Exactly
    * somewhat through AWS Scaling Groups for multiple VM's
    * Launch templates have helped to speed up manual deployment of a single VM
* Creation of the infrastructure they live in? No
* Setting up and Configuring of the software on them?
  * AMI's
  * User Data or start up scripts 
  * Bash scripts 
  

What if we could automate all of it?
  
## How does IaC help?
  * codify all of it 
  * we do NOT need to define steps (Different to bash scripts with are imperative)
    * We will define desired state/outcomes - that is called declarative ( the tools will work out the steps)
<br> 

## Solving the Problems with IaC

Infrastructure as Code (IaC) can do all the provisioning of:
*  the infrastructure itself(the servers, the networking)
*  configuring the servers( installing the software configuring the setting )


## What is IaC?
* a way to manage & provision computers through a machine-readable definition of infrastructure.


## benefit of IaC?
* Speed and simplicity 
* consistency and accuracy 
* version control
* scalable

## Tools available for IaC

2 types of IaC tools:
* Configuration management tools
  * They install/configure tools
  * examples
    * chef
    * Puppet 
    * Ansible
* orchestration tools
  * manage/orchestrate infrastructure
  * examples
    * CloudFormation(AWS)
    * Hashicorp terraform
    * ARM/Bicep templates (Azure)
    * Ansible (Can do this but best used as configuration management tool)


![alt text](/IaC/Images/terraform-diagram.png)

Terraform commands:
> * terraform init
> * terraform plan - non destructive
> * terraform apply
> * terraform destroy