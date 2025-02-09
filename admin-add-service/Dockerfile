FROM ruby:3.2

WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler

RUN bundle install

COPY . .

EXPOSE 1028

CMD ["ruby", "app.rb"]