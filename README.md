<img width="1064" alt="DevOps" src="https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/960fade6-bac1-4e5e-8bad-776598701de6">


# Project
A simple Jenkins CI/CD application deployment pipeline to Kubernetes on the AWS infrastructure. Automated with Terraform 

# Requirements
AWS Infrastructure
VPC following AWS best practice with public and private subnets
Jenkins
GitOps or equivalent
EKS

# Requirements Overview
Developers check-in code to Git repo, Upon Git check-in Jenkins build starts Jenkins build pushed docker image to ECR. 
Jenkins then deploys application image to EKS. User should be able to test deployed application with browser

# Steps 
Setting Up Jenkins on AWS Using Terraform

In this guide, we'll set up a Jenkins server on AWS using Terraform, a tool for infrastructure as code.

## Step 1: Terraform Script

We have a Terraform script in a repository that automates Jenkins server setup. You can access it here.

## Step 2: Customize

Modify the script as needed for your project, including instance type, region, and specific Jenkins configurations.
Step 3: Execution

Execute the Terraform script:
terraform init
terraform apply

Step 4: Post-Deployment
Access the Jenkins web interface using the public ipv4 address. configure Jenkins.

# Installing the right plugins for our project




and set up jobs and pipelines as required.
