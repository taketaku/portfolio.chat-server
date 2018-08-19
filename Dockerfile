FROM ruby:2.5.1

RUN apt-get update -qq
############################
# 汎用パッケージ
#---------------------------
# build-essential C/C++標準開発ツール一式
RUN apt-get install -y build-essential

############################
# rails postgres dependencies
#---------------------------
# RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/postgresql.list
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" >> /etc/apt/sources.list.d/postgresql.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  apt-get update && apt-get install -y postgresql-client-9.5

############################
# 環境変数設定
#---------------------------
ENV BUNDLE_PATH=/usr/local/bundle \
  BUNDLE_JOBS=4 \
  RAILS_LOG_TO_STDOUT=enabled \
  RAILS_SERVE_STATIC_FILES=enabled \
  LANG=C.UTF-8 \
  LC_ALL=C.UTF-8

############################
# 開発補助
#---------------------------
RUN apt-get install -y vim unzip
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


WORKDIR app
COPY . $APP_ROOT
RUN gem update bundler && bundle install
RUN echo 'alias be="bundle exec"' >> ~/.bashrc;
