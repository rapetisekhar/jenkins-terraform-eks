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

*  Go to Dashboard — Manage Jenkins — Plugins The simplest and most common way of installing plugins is through the Manage Jenkins > Plugins view, available to administrators of a Jenkins environment.
  
![image](https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/676e3688-e60a-4861-b364-7a67cd0bf6c4)


![image](https://github.com/profebass99/jenkins-terraform-eks/assets/104143346/8035e77e-53a9-48f3-899f-f842d6477173)


Here under Available plugins search for these plugins below and install it without restarting.
* CloudBees AWS Credentials
* Amazon ECR
* Docker Pipeline
* Maven integration
* AWS Credentials
* pipeline aws steps

## Step 7: Configuring Jenkins Credentials
Now, let's create AWS credentials in Jenkins:

* In the Jenkins dashboard, go to `"Manage Jenkins" > "Manage Credentials."`

* Under the "Stores scoped to Jenkins" section, click "Jenkins."

* Click "Global credentials (unrestricted)" and then "Add Credentials."

* Choose "AWS Credentials" as the kind of credential.

* In the "ID" field, provide a unique identifier for these credentials (e.g., "AWS_Credentials").

* Enter your AWS Access Key ID and Secret Access Key in the respective fields.

* Optionally, you can provide a description for these credentials.

* Click "OK" to save the credentials.


In our next steps, we'll establish a secure and automated connection between GitHub and Jenkins by generating a new SSH key pair. Adding your public SSH key to GitHub ensures secure authentication, authorizes Jenkins to access your repositories, and establishes trusted communication for secure interaction with your GitHub projects.

Additionally, incorporating this SSH key pair into Jenkins enables secure authentication with GitHub during interactions with repositories, facilitating a seamless and secure automation and integration process between Jenkins and GitHub. In summary, both GitHub and Jenkins rely on this SSH key pair for authentication and mutual trust, enabling a secure and automated collaboration between the two platforms.

### Generate an SSH Key Pair

* If you haven't already, generate an SSH key pair on your Jenkins server. You can use the ssh-keygen command for this purpose. Run the following command:

* `ssh-keygen -t rsa -b 4096 -C "your-email@example.com"`

* Replace "your-email@example.com" with your GitHub email address, and follow the prompts to generate the key pair.

* Add the SSH Public Key to GitHub

* Copy the contents of the public key file (~/.ssh/id_rsa.pub) you just generated.

* Log in to your GitHub account.

* Go to your GitHub account settings by clicking on your profile picture in the upper-right corner, then selecting "Settings."

* In the left sidebar, click on "SSH and GPG keys."

* Click "New SSH key" or "Add SSH key."

* Provide a title (e.g., "Jenkins Server") and paste the SSH public key into the "Key" field.

* Click "Add SSH key" to save.

* Configure Jenkins to Use the SSH Key

* Log in to your Jenkins dashboard.

* In the Jenkins dashboard, click on "Manage Jenkins" > "Manage Credentials."

* Under the "Stores scoped to Jenkins" section, click "Jenkins."

* Click "Global credentials (unrestricted)" and then "Add Credentials."

* Choose "SSH Username with private key" as the kind of credential.

* In the "Username" field, enter your GitHub username.

* In the "Private Key" field, select "Enter directly" and paste the contents of the private key (~/.ssh/id_rsa) you generated earlier.

* Provide a description (e.g., "GitHub SSH Key for Jenkins").

* Click "OK" to save the credentials.

# Step 8: Create an ECR on AWS and a new pipeline in Jenkins to run our jobs.

To create an Amazon Elastic Container Registry (ECR) repository in AWS, you can use either the AWS Management Console or the AWS Command Line Interface (CLI). Below, I'll provide instructions for both methods:

Method 1: Using the AWS Management Console
*Log in to your AWS account if you haven't already.

* From the AWS Management Console, go to the "Services" dropdown in the top left corner, and under the "Compute" section, select "ECR" (Elastic Container Registry).

* In the ECR dashboard, click the "Create repository" button.

* Enter a unique name for your repository in the "Repository name" field. Optionally, add a tag immutability policy if desired. Click "Create repository" to create the ECR repository.



