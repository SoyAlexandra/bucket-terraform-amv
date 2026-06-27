# Terraform Cloud Integration with GitHub and AWS (OIDC)

## Overview

This project demonstrates the integration of **GitHub**, **Terraform Cloud**, and **Amazon Web Services (AWS)** to provision cloud infrastructure using **Infrastructure as Code (IaC)**.

The implementation follows enterprise best practices by using **Version Control Workflow** in Terraform Cloud and **OpenID Connect (OIDC)** with **AWS IAM Roles** for authentication. This approach eliminates the need to store long-lived AWS Access Keys and instead relies on temporary credentials issued by AWS Security Token Service (STS).

The infrastructure deployed in this project is an Amazon S3 bucket, used as a simple resource to demonstrate the complete deployment workflow.

---

# Solution Architecture

```text
                       Git Push
Developer
(Visual Studio Code)
        │
        ▼
 GitHub Repository
        │
        ▼
Terraform Cloud
Version Control Workspace
        │
        │
        │ OIDC Authentication
        ▼
 AWS Security Token Service (STS)
        │
        ▼
 IAM Role
        │
        ▼
 Amazon Web Services
        │
        ▼
 Amazon S3 Bucket
```

---

# Objectives

This project demonstrates how to:

- Integrate GitHub with Terraform Cloud.
- Configure a Terraform Cloud Workspace using Version Control Workflow.
- Configure AWS authentication using IAM Roles and OpenID Connect (OIDC).
- Provision AWS infrastructure without Access Keys.
- Automate infrastructure deployments using Git commits.
- Manage infrastructure changes through Terraform Cloud.

---

# Technologies

- Terraform
- Terraform Cloud
- Git
- GitHub
- Amazon Web Services (AWS)
- AWS IAM
- AWS Security Token Service (STS)
- OpenID Connect (OIDC)
- Amazon S3

---

# Repository Structure

```text
terraform-cloud-aws-integration/
│
├── main.tf
├── README.md
└── .gitignore
```

---

# Deployment Workflow

1. Develop the infrastructure locally.
2. Commit the changes.
3. Push the code to GitHub.
4. Terraform Cloud detects the new commit.
5. Terraform Cloud downloads the latest version of the repository.
6. Terraform Cloud authenticates with AWS using OIDC.
7. AWS STS issues temporary credentials by assuming an IAM Role.
8. Terraform executes `terraform init`.
9. Terraform executes `terraform plan`.
10. After approval (or automatically if Auto Apply is enabled), Terraform executes `terraform apply`.
11. AWS provisions the infrastructure.

---

# End-to-End Process

```text
Developer
     │
     ▼
git add
     │
     ▼
git commit
     │
     ▼
git push
     │
     ▼
GitHub Repository
     │
     ▼
Terraform Cloud Workspace
     │
     ▼
OIDC Authentication
     │
     ▼
AWS IAM Role
     │
     ▼
terraform init
     │
     ▼
terraform plan
     │
     ▼
terraform apply
     │
     ▼
Amazon S3
```

---

# Infrastructure

The current implementation provisions:

- Amazon S3 Bucket

Although the deployed infrastructure is intentionally simple, the same architecture can be used to provision production-grade environments including:

- Amazon EC2
- Amazon RDS
- Amazon VPC
- IAM Roles and Policies
- Load Balancers
- Amazon EKS
- Route 53
- CloudFront
- Lambda Functions

---

# Authentication Model

Instead of using static AWS credentials, this project implements **Workload Identity Federation**.

Terraform Cloud authenticates to AWS using:

- OpenID Connect (OIDC)
- AWS Security Token Service (STS)
- IAM Role Assumption

This approach provides:

- Temporary credentials
- Improved security
- Credential rotation managed by AWS
- No Access Keys stored in Terraform Cloud
- Enterprise-grade authentication

---

# AWS Configuration

The AWS account must be configured with:

- OpenID Connect Identity Provider
- IAM Role
- Trust Policy allowing Terraform Cloud
- IAM Permissions required to provision infrastructure

Terraform Cloud only requires the ARN of the IAM Role to obtain temporary credentials.

---

# Terraform Cloud Configuration

Terraform Cloud is configured using:

- Organization
- Project
- Version Control Workspace
- GitHub Integration
- Environment Variables
- Remote State
- Remote Execution

---

# Skills 

This repository demonstrates practical experience with:

- Infrastructure as Code (IaC)
- Terraform
- Terraform Cloud
- Git
- GitHub
- AWS
- Amazon S3
- IAM Roles
- OpenID Connect (OIDC)
- Workload Identity Federation
- Remote Terraform Execution
- Infrastructure Automation
- Version Control Workflow
- Cloud Infrastructure Deployment

---

# Security Best Practices

This implementation follows several AWS and HashiCorp recommendations:

- No long-lived AWS Access Keys.
- IAM Role authentication.
- OpenID Connect federation.
- Temporary credentials.
- Infrastructure managed as code.
- Source-controlled deployments.
- Remote Terraform execution.
- Separation of infrastructure code and cloud credentials.

---

# Future Enhancements

Possible improvements include:

- S3 Versioning
- Server-Side Encryption (SSE)
- Lifecycle Policies
- Public Access Block
- Bucket Policies
- Terraform Modules
- Multiple Workspaces (Development, QA, Production)
- Sentinel Policies
- Open Policy Agent (OPA)
- Cost Estimation
- Run Tasks
- CI/CD Pipelines
- Multi-account AWS deployments

---

# References

- Terraform Documentation
- Terraform Cloud Documentation
- Terraform Registry
- AWS Provider Documentation
- Amazon S3 Documentation
- AWS IAM Documentation
- AWS Security Token Service Documentation

---

# License

This repository was created as part of my professional portfolio to demonstrate cloud infrastructure automation using Terraform Cloud, GitHub, and AWS following enterprise-grade authentication and deployment practices.
