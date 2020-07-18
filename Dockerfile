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
RUN mkdir /docker-rails
WORKDIR /docker-rails
COPY Gemfile /docker-rails/Gemfile
COPY Gemfile.lock /docker-rails/Gemfile.lock
RUN bundle install
COPY . /docker-rails
RUN apt-get install npm -y
RUN npm install yarn


# Add a script to be executed every time the containers starts.
COPY entrypoint.sh /usr/bin
RUN chmod 777 /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD rails s -p 3000