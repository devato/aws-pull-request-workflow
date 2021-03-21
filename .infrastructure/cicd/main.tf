terraform {
  required_version = ">= 0.12.4"

  # Comment this out to skip remote state storage.
  backend "s3" {
    bucket = "awsapp-cicd-terraform-remote-state"
    key    = "cicd/awsapp/state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

## CodeBuild resources
# set your account_id found in AWS console:
# My Account XXXXXXXXXXXX
module "cicd_awsapp_codebuild" {
  source           = "./modules/codebuild"
  account_id       = "675164978622" 
  buildspec_file   = "buildspec.yml" 
  codebuild_name   = "awsapp-pull-request-workflow"
  image            = "aws/codebuild/standard:4.0"
  repo             = "awsapp"
  codebuild_role   = "awsapp-codebuild-role"
  codebuild_policy = "awsapp-codebuild-policy"
  region           = "us-east-1"
}

## CloudWatch Events resources
module "cicd_awsapp_cloudwatch" {
  source            = "./modules/cloudwatch"
  cloudwatch_role   = "awsapp-cloudwatch-role"
  cloudwatch_policy = "awsapp-cloudwatch-policy"
  event_description = "Trigger CodeBuild on create/update pull request for awsapp"
  event_name        = "awsapp-pull-request-workflow"
  codebuild_arn     = module.cicd_awsapp_codebuild.codebuild_arn
  target_id         = "awsapp-pull-request-workflow-trigger"
  repo              = "awsapp"
}
