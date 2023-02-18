FROM alpine:3.17

RUN apk add ruby
RUN gem install bundler -v '2.4.6'
RUN gem install sinatra

