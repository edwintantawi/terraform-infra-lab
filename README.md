# Terraform Infra Lab

Repository for trying **Terraform** with **Google Cloud Platform**.

## How To Start

### Init Terraform

Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.

```bash
terraform init
```

### Add required variabels

By adding variables in the `variables.tfvars` file in the project root, with the variables below:

```
project_id = '<Google Cloud Project ID>';
project_region = '<Google Cloud Region | (us-central1)>';
project_zone = '<Google Cloud Zone | (us-central1-c)>';
```

### Terraform Plan

Generates a speculative execution plan, showing what actions Terraform would take to apply the current onfiguration. This command will not actually perform the planned actions.

```bash
terraform plan --var-file variabels.tfvars
```

### Terraform Apply

Creates or updates infrastructure according to Terraform configuration files in the current directory.

```bash
terraform apply --var-file variabels.tfvars
```

### Terraform Destroy

Destroy Terraform-managed infrastructure.

```bash
terraform destroy --var-file variabels.tfvars
```
