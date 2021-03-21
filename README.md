# AWS CodeCommit <> CodeBuild PR Example

Example Application for Tutorial:

https://devato.com/post/codecommit-codebuild-pull-request-workflow

## Required

- S3 bucket for storing Terraform remote state.
- CodeCommit repository for pushing code.
- Terraform and aws-cli installed.

## Run tests

```
$ docker-compose --env MIX_ENV=test run --rm test
```
