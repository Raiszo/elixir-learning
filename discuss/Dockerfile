FROM elixir:1.9.1-alpine

WORKDIR /usr/src/app

RUN  mix local.hex --force && mix local.rebar --force

RUN apk --update add inotify-tools

CMD ["mix", "phx.server"]
