# cloud-resume-challenge

## Setting up terraform

Install terraform locally
Install AWS CLI

Generate access credentials from aws

Setup main.tf file

- Add in aws provider
- add in s3 bucket resource

Log in into Terraform Cloud

- add the following to the terraform code block and then then 'terraform login' in the cli and generate access token

```tf
 cloud {
    organization = "edleeennaorg"

    workspaces {
      name = "cloud-resume-aws"
    }
```