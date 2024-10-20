# Dockerfile

FROM ruby:3.1.2

# Node.jsとYarnのインストール
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install -g yarn

# RubyGemsとBundlerを最新化
RUN gem update --system
RUN gem install bundler

# gem関連の操作を`root`ユーザーで実行
# その後、`/usr/local/bundle`の所有者を変更
RUN chown -R 1000:1000 /usr/local/bundle

# 作業ディレクトリの設定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock /app/

# Gemのインストール
RUN bundle install

# 再度、`/usr/local/bundle`とアプリケーションディレクトリの所有者を変更
RUN chown -R 1000:1000 /usr/local/bundle /app

# アプリケーションコードをコピー
COPY . /app
