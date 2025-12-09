# Intro to Terraform
 
- [Intro to Terraform](#intro-to-terraform)
  - [What is Terraform? What is it used for?](#what-is-terraform-what-is-it-used-for)
  - [Why use Terraform? The benefits?](#why-use-terraform-the-benefits)
- [Configuration Drift](#configuration-drift)
  - [Alternatives to Terraform](#alternatives-to-terraform)
  - [Who is using Terraform in the industry?](#who-is-using-terraform-in-the-industry)
  - [In IaC, what is orchestration?](#in-iac-what-is-orchestration)
  - [How does Terraform act as "orchestrator"?](#how-does-terraform-act-as-orchestrator)
  - [Best practice supplying AWS credentials to Terraform](#best-practice-supplying-aws-credentials-to-terraform)
  - [Why use Terraform for different environments (e.g. production, testing, etc)](#why-use-terraform-for-different-environments-eg-production-testing-etc)
- [Configuration Drift](#configuration-drift-1)


## What is Terraform? What is it used for?
  * An orchestrational tool
  * Different to configuration management tools like Ansible, which deploy software onto existing servers
  * Sees infrastructure as immutable(i.e. disposable), While CM tools see infrastructure as mutable/reusable ( want to change or update existing servers)
  * Uses Hashicorp configuration language (HCL) - tries to balance human + machine readability
 
## Why use Terraform? The benefits?
 
 * Deploys infrastructure not just applications
 * easy to use
 * Sort of open-source
   * in 2023 , started to use business Source License  (BSL)
   * many organizations prefer to use OpenTofu
     * community driven, Linux foundation-Hosted fork of Terraform
     * aims to be a drop-in replacement, maintains compatibility with Terraform state/modules.

<br>

* Declarative - says what you want, not how you do it.
* Cloud-agnostic - deploy to any cloud provider.
* uses different providers (which are like plugins)
to deploy to particular cloud providers

* Expressive & extensible
--------------------------------------------------------
# Configuration Drift
  ![alt text](/IaC/Images/config-drift.png)


## Alternatives to Terraform
 * Pulumi
 * Cloud Specific rather than cloud-agnostic:
   * AWS Cloud Formation
   * GCP Deployment manager
   * Azure Resource Manager (ARM)


## Who is using Terraform in the industry?
 Tech Companies and Startups:
Uber, Spotify, Airbnb, Coinbase
 
Financial Institutions (regulated industry):
JPMorgan Chase, Goldman Sachs, Capital One
 
Cloud Providers and SaaS Platforms:
AWS, Google Cloud, Salesforce
 
Media and Entertainment:
The New York Times, Netflix
 
Healthcare (regulated industry) and Life Sciences:
Philips, Cerner
 
Telecommunications:
Verizon, T-Mobile
 
Retail and E-Commerce:
Walmart, Target
 
Gaming Industry:
Electronic Arts (EA), Riot Games (they make/run League of Legends)
 
Government and Public Sector:
UK Government Digital Service (GDS), NASA
 
Consulting and Cloud Services:
Accenture, Deloitte
 
Education and Research Institutions:
Harvard University, MIT


## In IaC, what is orchestration? 
* process of automating & managing **infrastructure**

## How does Terraform act as "orchestrator"?
*  Doesn't just create or provision infrastructure, also...
*  Coordinates pieces of infrastructure to work together, which includes...
   *  Setting things up or destroying in the correct order
   *  connects resources together properly 
 
## Best practice supplying AWS credentials to Terraform

order in which terraform looks up AWS credentials

1. Environment Variables:  **(OK TO DO IF USING LOCAL PC)**
   * AWS_ACCESS_KEY_ID
   * AWS_SECRET_ACCESS_KEY
<br>
2. Terraform variables( get them from your code) -
should not do this - credentials should not be hard-coded.
<br>
1. AWS CLI and the "aws configure" **(OK TO DO IF USING LOCAL PC)**
   <br>
2. EC2 instance metadata - you assign an IAM (Identity Access Management) role to the EC2 instance where you are running the Terraform commands **(BEST PRACTICE)**

 
## Why use Terraform for different environments (e.g. production, testing, etc)
 
 * Production
   * Easily modify dev/test/other env to be larger scale (More expensive)
  <br> 
 * Dev and Testing
   * Quick reproducible deployments
   * Devs can quickly spin up a testing environment that mirrors production.
   * Can quickly tear it down after testing (Saving money)


--------------------------------------------------------

# Configuration Drift


https://github.com/OlliKm/tech515-terraform-learning.git