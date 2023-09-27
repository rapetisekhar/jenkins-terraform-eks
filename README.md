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

We will configure AWS credentials or profiles that Terraform will use to create resources in AWS is a crucial step in the process. Here's how to do it:

## Step 1: Set Up AWS Credentials

* AWS CLI Installation: If you haven't already, install the AWS Command Line Interface (CLI) on your local machine.

* AWS Account: Ensure you have an AWS account with IAM user(you may give it admin previlege) having  the necessary permissions to create EC2 instances, security groups, and other resources.

* AWS Access Key and Secret Key: Obtain your AWS access key ID and secret access key. These are the credentials Terraform will use to authenticate with AWS.

## Step 2: Configure AWS CLI

Open a terminal and run the following command to configure AWS CLI:
`aws configure`

You will be prompted to enter:
* AWS Access Key ID: Enter your access key ID.
* AWS Secret Access Key: Enter your secret access key.
* Default region name: Specify your preferred AWS region (e.g., us-east-1).
* Default output format: You can leave this as the default (e.g., json).

## Step 3: Terraform Script

We have a Terraform script in a repository that automates Jenkins server setup. You can access it here.

## Step 4: Customize

Modify the script as needed for your project, including instance type(as we know is better to use a suitable instance type for jenkins, i recommend using atleast for this project a t2.medium), region, and specific Jenkins configurations.

## Step 5: Execution
Execute the Terraform script:
`terraform init`
`terraform apply`

## Step 6: Post-Deployment & Installing the right plugins for our project
Access the Jenkins web interface using the public ipv4 address and you will be prompted with the image below 
![image](https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/b67f6f53-13d3-4182-8040-b109509eeb94)

Now navigate to the highlighted link in directory in the jenkins server to retrieve the password using the command `sudo cat abovementionedlocation`and you should be good to go.
Next  is to launch your Jenkins instance with the suggested plugins.
First we will install suggested plugins and later we will install tyhe needed plugins for our project :).
Lets go!!!!!
![image](https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/e45b8c02-c35b-468c-a188-3338870a05ef)

Then give the details required, save and continue.

![image](https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/d0c5de7d-e3e5-40f6-a941-4a66e1a71042)

*  Go to Dashboard — Manage Jenkins — Plugins
*  
![image](https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/154b4088-4833-475e-9a55-119a1a674ff7)
* Here under Available plugins search for these plugins below and install it without restarting.



# 




and set up jobs and pipelines as required.
