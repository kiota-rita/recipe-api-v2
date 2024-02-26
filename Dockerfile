FROM ruby:3.2.2

WORKDIR /var/app
COPY . .

RUN bundle config timeout 240

RUN bundle install -j4

ENTRYPOINT [ "./entrypoint.sh" ]
