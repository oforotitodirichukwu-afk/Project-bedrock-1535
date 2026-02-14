🚀 Project Bedrock
Production-Grade Microservices on Amazon EKS (Terraform + CI/CD)
📌 Project Overview

Project Bedrock is a production-grade Kubernetes infrastructure deployed on AWS using Infrastructure as Code (Terraform) and automated through GitHub Actions CI/CD.

This project demonstrates real-world DevOps practices including:

Infrastructure as Code (IaC)

Remote Terraform state management

State locking with DynamoDB

Secure IAM role separation

EKS cluster provisioning

Kubernetes RBAC

CI/CD automation

Serverless integration (S3 + Lambda)

🏗️ Architecture Overview
                        ┌────────────────────────┐
                        │   GitHub Repository     │
                        │   (Push to main)        │
                        └────────────┬────────────┘
                                     │
                                     ▼
                        ┌────────────────────────┐
                        │   GitHub Actions CI/CD │
                        │  terraform init/plan   │
                        │  terraform apply       │
                        └────────────┬────────────┘
                                     │
                                     ▼
        ┌──────────────────────────────────────────────────┐
        │                     AWS Cloud                    │
        │                                                  │
        │   ┌──────────────┐        ┌─────────────────┐   │
        │   │     VPC      │        │   DynamoDB      │   │
        │   │ Public/Priv  │        │  State Locking  │   │
        │   └──────┬───────┘        └─────────────────┘   │
        │          │                                         │
        │   ┌──────▼────────┐       ┌─────────────────┐   │
        │   │   Amazon EKS  │       │   S3 Backend    │   │
        │   │  Node Groups  │       │ Terraform State │   │
        │   └──────┬────────┘       └─────────────────┘   │
        │          │                                         │
        │   ┌──────▼────────┐                               │
        │   │  Kubernetes   │                               │
        │   │   Workloads   │                               │
        │   └───────────────┘                               │
        │                                                  │
        │   ┌─────────────────┐                            │
        │   │  Lambda + S3    │                            │
        │   └─────────────────┘                            │
        └──────────────────────────────────────────────────┘

🧱 Infrastructure Components
Networking

Custom VPC

Public & Private Subnets

Internet Gateway & Routing

Compute

Amazon EKS Cluster

Managed Node Group

Storage

S3 (Terraform remote backend)

DynamoDB (State locking)

Security

IAM Roles and Policies

Kubernetes RBAC

Separation of Duties (Admin vs Dev)

Serverless

AWS Lambda Function

S3 Event Trigger

🔐 Security Design

This project enforces least privilege access:

IAM User	Purpose	Permission Level
bedrock-dev-view	Developer access	ReadOnlyAccess
bedrock-terraform-admin	CI/CD pipeline	AdministratorAccess

Terraform state locking prevents concurrent infrastructure changes using DynamoDB.

🔁 CI/CD Pipeline

The GitHub Actions workflow:

Terraform Init

Terraform Validate

Terraform Plan

Terraform Apply

Triggered automatically on push to main.

Workflow file:

.github/workflows/terraform.yml

📁 Repository Structure
.
├── .github/workflows/terraform.yml    # CI/CD pipeline
├── app/                               # Application layer
├── lambda/index.py                    # Lambda function
├── terraform/                         # Infrastructure as Code
│   ├── backend.tf                     # S3 + DynamoDB backend
│   ├── vpc.tf                         # Networking
│   ├── eks.tf                         # EKS cluster + node group
│   ├── iam.tf                         # IAM roles & policies
│   ├── rbac.tf                        # Kubernetes RBAC
│   ├── s3_lambda.tf                   # S3 + Lambda resources
│   ├── outputs.tf                     # Terraform outputs
│   └── providers.tf                   # AWS provider
├── .gitignore
└── README.md

🚀 Deployment Instructions
Local Deployment
cd terraform
terraform init
terraform plan
terraform apply

CI/CD Deployment

Push to main branch:

git add .
git commit -m "Deploy infrastructure"
git push origin main

🧪 Validation Commands
aws eks update-kubeconfig --region us-east-1 --name project-bedrock-cluster

kubectl get nodes
kubectl get pods -A

⚠️ Challenges Faced & Solutions
1️⃣ DynamoDB State Lock Error

Problem:
Terraform failed due to insufficient IAM permissions.

Solution:
Separated developer access from CI/CD admin user and granted AdministratorAccess to pipeline user.

2️⃣ IAM & RBAC Mapping Issues

Problem:
EKS access errors during kubectl operations.

Solution:
Configured proper aws-auth mapping and RBAC roles.

📊 Terraform Outputs
terraform output -json > grading.json


Key outputs include:

Cluster Name

Cluster Endpoint

Assets Bucket Name

Access Keys (non-sensitive)

🏆 Skills Demonstrated

Infrastructure as Code (Terraform)

Kubernetes (EKS)

CI/CD Automation

AWS Networking

IAM Security Architecture

Remote Backend Configuration

State Locking Mechanism

Production-Grade DevOps Practices

👤 Author

 OFOR OTITODIRICHUKWU-1535
Cloud DevOps Engineer

AltSchool Africa – Capstone Project-Baraka-2024/2025
