# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.238.30.181', user: 'shoji', roles: %w{app db web}

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/house_coffee_app_key_rsa' 
