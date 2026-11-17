# Terraform Infrastructure for API Gateway and Lambda

## Project Structure

```
.
├── environments/
│   └── dev/
│       ├── main.tf          # Root module configuration for dev environment
│       ├── terraform.tfvars # Environment-specific variables
│       └── variables.tf     # Input variables for dev environment
├── modules/
│   ├── api_gateway/
│   │   ├── main.tf          # API Gateway resources
│   │   ├── variables.tf     # Input variables
│   │   └── outputs.tf       # Output values
│   └── lambda/
│       ├── main.tf          # Lambda function resources
│       ├── variables.tf     # Input variables
│       └── outputs.tf       # Output values
├── providers.tf             # Provider configurations
├── versions.tf              # Terraform version constraints
└── README.md                # This file
```

## Prerequisites

- Terraform 1.7.0 or later
- AWS CLI configured with appropriate credentials
- AWS account with permissions to create API Gateway and Lambda resources

## Setup Instructions

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Plan the deployment** (for dev environment):
   ```bash
   terraform plan -var-file="environments/dev/terraform.tfvars"
   ```

3. **Apply the configuration**:
   ```bash
   terraform apply -var-file="environments/dev/terraform.tfvars"
   ```

## Validation

After applying the configuration, verify the resources were created successfully:
- Check the API Gateway in the AWS Console
- Verify the Lambda function is deployed and has the correct triggers

## Environment Variables

The `environments/dev/terraform.tfvars` file contains environment-specific values. Modify these as needed for your deployment.

## Modules

### API Gateway Module
Creates an API Gateway with the specified configuration.

### Lambda Module
Creates a Lambda function with the specified runtime and handler.