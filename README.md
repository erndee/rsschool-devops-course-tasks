# rsschool-devops-course-tasks
Repository name explains it all

## Required tools & Services to complete the task
- Terraform
- AWS Console
- GitHub

## Steps to complete the task

### Step 1: Create AWS account
* Create an AWS account if you don't have one.
* Add MFA to your root account.
* Create an IAM user with programmatic access.
* Attach the required policies to the user.
* Save the access key and secret key.
* Add MFA to the IAM user.

### Step 2: Terraform Configuration
* Start configuring Terraform by creating a new file named `provider.tf` where you can specify the provider.
* Run `terraform init` to initialize the directory with the configuration files.
* Create `backend.tf` file to specify the backend configuration.
* Before adding the resources to `provider.tf` file, run `terraform apply` (don't forget to run additional commands as well: fmt / validate / plan`) to create the S3 bucket and DynamoDB table.
* Add the backend resources to `provider.tf` file.

### Step 3: Create a resource
* Create a new file named `main.tf` to add the resources.
* Add the required resources(oidc provider role) to the `main.tf` file.

### Step 4: Create a GitHub Actions workflow
* Create a new file named `terraform.yml` in the `.github/workflows` directory.
* Add the required steps to the workflow file.

### Step 5: Push the changes to the repository
* Update the README.md file with the steps you have followed.
* Push the changes to the repository.
