# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    # Tools
    apt-get install -y emacs
    # postgres
    apt-get install -y postgresql
    /etc/init.d/postgresql start
    sudo -u postgres createuser -d vagrant
    sudo -u postgres createdb vagrant
    /etc/init.d/postgresql stop
    systemctl enable postgresql
    # heroku
    snap install --classic heroku
    # ruby
    apt-get install -y ruby-build
    sudo su - vagrant <<EOF
      rbenv install 2.4.1
      rbenv global 2.4.1
EOF
  SHELL
end

=begin
=end

=begin
インストール済
       "apt",
       "git",
       "vim",
aptでインストール
       "enpit::emacs24",
       "postgresql", "postgresql::server", "postgresql::client", "postgresql::libpq",
       "ruby_rbenv::user", "ruby_build",		# an rbenv plugin
snapでインストール       
       "heroku-toolbelt",

インストールしない
       "locale",
       "zsh",
       "enpit::github-connect",
       "enpit::generate_rails", # rails generate後，Travis CI, Herokuの設定をするスクリプト
       "enpit::bash_profile",　# hubコマンドのalias
       "enpit::gemrc", # gem: --no-rdoc --no-ri
       "enpit::gitconfig", # push モードとか
       "enpit::hub", # https://github.com/github/hub

TODO：
      - PSQL DBの作成
      - ruby特定バージョンのインストール       
=end
