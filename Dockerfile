FROM ruby:2.5

LABEL maintainer="Guilherme Mascarenhas Barbosa <gmascb@gmail.com>"

ARG RAILS_ENV=development
ARG DEVELOPMENT_DATABASE_HOST=db
ARG DEVELOPMENT_DATABASE_USERNAME=postgres
ENV RAILS_ENV=${RAILS_ENV} \
    DEVELOPMENT_DATABASE_USERNAME=${DEVELOPMENT_DATABASE_USERNAME} \
    LANG=C.UTF-8 \
    DEVELOPMENT_DATABASE_HOST=${DEVELOPMENT_DATABASE_HOST}

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get install yarn -y

# prepareing enviroments
RUN mkdir /myapp
WORKDIR /myapp

# Preparing Rails app dependencies
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install

COPY . ./

EXPOSE 3000

CMD bundle exec rails s -b 0.0.0.0