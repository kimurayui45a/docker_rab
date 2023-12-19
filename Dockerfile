FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update && apt-get install -y nano
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential libpq-dev nodejs yarn
RUN npm install -g sass
RUN mkdir /docker_rab
WORKDIR /docker_rab
RUN gem install bundler:2.3.17
COPY Gemfile /docker_rab/Gemfile
COPY Gemfile.lock /docker_rab/Gemfile.lock
COPY yarn.lock /docker_rab/yarn.lock
RUN bundle install
RUN yarn install
COPY . /docker_rab
EXPOSE 4000
CMD ["rails", "server", "-b", "0.0.0.0"]