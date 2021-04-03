FROM public.ecr.aws/v6p4m1q6/alpine-elixir:latest

ENV MIX_ENV=test

RUN mix local.hex

ADD . /app/

WORKDIR /app
