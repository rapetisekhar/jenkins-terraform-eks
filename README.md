

# Project
A simple Jenkins CI/CD application deployment pipeline to Kubernetes on the AWS infrastructure.

# Requirements
AWS Infrastructure
VPC following AWS best practice with public and private subnets
Jenkins
GitOps or equivalent
EKS

# Requirements Overview
Developers check-in code to Git repo
Upon Git check-in Jenkins build starts
Jenkins build pushed docker image to ECR
Jenkins deploy application image to EKS
User should be able to test deployed application with browser

# Steps 
