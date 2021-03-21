defmodule AwsApp.Repo do
  use Ecto.Repo,
    otp_app: :aws_app,
    adapter: Ecto.Adapters.Postgres
end
