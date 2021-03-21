FROM bitwalker/alpine-elixir-phoenix

ENV MIX_ENV=test

RUN mix local.hex

ADD . /app/

WORKDIR /app
