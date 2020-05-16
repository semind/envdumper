FROM ruby:2.7.1-slim-buster

WORKDIR /app
ADD daemon.rb /app
EXPOSE 3000

CMD ["ruby", "daemon.rb"]