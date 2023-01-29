#ベースイメージ
FROM node 
#環境変数の定義
ENV NODE_ENV=production
#基準のディレクトリ
WORKDIR /scripts
#ホスト→コンテナ　にコピーする
COPY . .
#コマンド実行。ライブラリやパッケージのインストール
RUN npm install \
    && groupadd app \
    && useradd -g app -m app \
    && mv /root/.config /home/app/ \
    && chown -R app:app /scripts /home/app/.config
#ログインユーザー。デフォルトはrootなので、設定するのが吉
USER app
#デフォルトコマンドの設定
CMD ["npm", "start"]