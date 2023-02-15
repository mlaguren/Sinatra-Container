FROM alpine:3.17

RUN apk add ruby
RUN gem install bundler
RUN gem install sinatra

