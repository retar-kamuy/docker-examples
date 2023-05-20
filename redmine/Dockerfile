FROM redmine:4.0

# 環境変数の自動設定
ENV REDMINE_DB_MYSQL mysql
ENV TZ Asia/Tokyo

# プラグインのコピー
COPY plugins /usr/src/redmine/plugins

# テーマのコピー
COPY themes /usr/src/redmine/public/themes

# configurationファイルのコピー
COPY config/configuration.yml /usr/src/redmine/config/
RUN apt-get -y update \
    && apt-get install -y unzip \
    && cd /usr/src/redmine/public/themes \
    && unzip circle_theme-2_1_6.zip \
    && rm circle_theme-2_1_6.zip \
    && touch /tmp/restart.txt