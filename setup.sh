#!/bin/sh

docker-compose exec php sh -c 'composer create-project --prefer-dist laravel/laravel .'
docker-compose exec php sh -c 'sed -i -e "s/DB_HOST=127.0.0.1/DB_HOST=mysql/" .env'
docker-compose exec php sh -c 'sed -i -e "s/DB_PASSWORD=/DB_PASSWORD=laravel/" .env'
docker-compose exec php sh -c 'php artisan migrate'

grep 'laravel.local' /etc/hosts
if [ $? = 1 ]; then
  echo '/etc/hosts にローカル用ドメインを追加する為 sudo が必要です。'
  echo 'このMacにログインする時のパスワードを入力して下さい。'
  echo 'sudo vi /etc/hosts'
  sudo sh -c "echo '127.0.0.1       laravel.local' >> /etc/hosts"
fi

echo 'Setup completed!'
echo 'Go to http://laravel.local'
