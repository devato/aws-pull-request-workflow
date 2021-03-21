resource "aws_codebuild_project" "main" {
  name = var.codebuild_name
  service_role = aws_iam_role.codebuild_role.arn
  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = var.image
    type = "LINUX_CONTAINER"
    privileged_mode = true
  }
  source {
    type = "CODECOMMIT"
    buildspec = var.buildspec_file
    location = data.aws_codecommit_repository.repo.clone_url_http
  }

  badge_enabled = true
  cache {
    type = "LOCAL"
    modes = ["LOCAL_CUSTOM_CACHE", "LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
  }
}
