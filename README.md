# GCP Terraform Learning Repository

This repository contains examples and resources for learning Terraform with Google Cloud Platform (GCP).

## Overview

This project aims to provide practical examples for using Terraform to provision and manage GCP resources. It's designed for beginners and intermediate users who want to learn infrastructure as code with Terraform on Google Cloud.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0+)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A Google Cloud Platform account
- Basic understanding of cloud concepts

## Getting Started

1. Clone this repository
2. Authenticate with Google Cloud:

   ```bash
   gcloud auth application-default login
   ```

3. Navigate to an example directory:

   ```bash
   cd example-1
   ```

4. Initialize Terraform:

   ```bash
   terraform init
   ```

5. Plan your changes:

   ```bash
   terraform plan
   ```

6. Apply your changes:

   ```bash
   terraform apply
   ```

## Repository Structure

- `example-1/`: Basic GCP resource provisioning
- Additional examples will be added as the repository grows

## Important Notes

- Remember to destroy resources when you're done to avoid unnecessary charges:

  ```bash
  terraform destroy
  ```

- The `.gitignore` file is configured to exclude sensitive files like `.tfstate`, `.tfvars`, and the `.terraform/` directory

## Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Google Provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [GCP Free Tier](https://cloud.google.com/free)
