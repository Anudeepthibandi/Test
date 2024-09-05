Design Iac(terraform,AWS ECS/Fargate) for Medusa open source headless commerce platform

The projects demonstrates the creating Infrastructure as code using Terraform for deploying the Medusa open source headless commerce platform backend on AWS ECS?Fargate and setup a Continuous Deployment(CD) pipeline using Github Actions

# Prerquisites
1.Install Terraform in your local or remote server by using Amazon EC2 instance
2.Install git and configure credentials ang github account

Terraform Configuration for AWS ECS/Fargate
1.VPC Setup
2.Security Groups
3.ECS Cluster
4.IAM Roles created manually using AWS resources and provided respective access and stored secret keys in github secret manager
5.ECS Task Definition
6.ECS Service

1. Terraform module to set up resources  VPC,Security Groups,ECS Cluster,ECS Service
   

