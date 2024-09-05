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
https://github.com/Anudeepthibandi/Test/blob/main/Screenshots/Main.tf%20part1.png
https://github.com/Anudeepthibandi/Test/blob/main/Screenshots/Main.tfpart2.png
https://github.com/Anudeepthibandi/Test/blob/main/Screenshots/Main.tfpart3.png
2. Terraform module to set up providers
https://github.com/Anudeepthibandi/Test/blob/main/Screenshots/provider.tf.png
3. Terraform module for variables
https://github.com/Anudeepthibandi/Test/blob/main/Screenshots/variables.tf.png
4. Terraform module for output
https://github.com/Anudeepthibandi/Test/blob/main/Screenshots/Output.tf.png

After setting up these modules for infrastructure as code 
* Terraform init -- to intialize the terraform
* Terraform plan -- to review the infrastructure
* Terraform apply -- to create the infrastructure for the medusa application

5.Github action
  git init
  git add.
  connect to remote repository using http url or ssh and provide credentials if it needed

  Create a .yml file or upload .yml file to your github once it commit and it code is pushed and Once the actions are scucceeded we can check the output ECScluster and ECS task service in the AWS.
  push the code to github 

   

