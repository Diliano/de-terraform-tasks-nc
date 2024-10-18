provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      Project = "TerraformTasks"
      Environment = "Dev"
      ManagedBy = "Terraform"
      Repository = "https://github.com/Diliano/de-terraform-tasks"
      Owner = "NC-DP"
    }
  }
}