FROM ruby:3.0.1-alpine

ENV BUNDLER_VERSION=2.2.22

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      yarn

WORKDIR /app
RUN gem install bundler -v 2.2.22
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]