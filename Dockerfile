FROM ruby:2.5.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver
RUN mkdir /house_coffee
WORKDIR /house_coffee
COPY Gemfile /house_coffee/Gemfile
COPY Gemfile.lock /house_coffee/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /house_coffee
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]