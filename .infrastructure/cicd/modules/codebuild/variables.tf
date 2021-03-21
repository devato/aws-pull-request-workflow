variable "repo" {
  type = string
}
variable "codebuild_name" {
  type = string
}
variable "image" {
  type = string
}
variable "buildspec_file" {
  type = string
}
variable "codebuild_role" {
  type = string
}
variable "codebuild_policy" {
  type = string
}
variable "region" {
  type = string
}
variable "account_id" {
  type      = string
  sensitive = true
}
