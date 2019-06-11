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
    apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
    sudo su - vagrant <<'EOF'
      cd ~
      # rbenv
      git clone https://github.com/rbenv/rbenv.git ~/.rbenv
      echo 'export PATH=~/.rbenv/bin:$PATH' >> ~/.bashrc
      echo 'eval "$(rbenv init -)"' >> ~/.bashrc
      source ~/.bashrc
      # ruby-build
      mkdir -p ~/.rbenv/plugins
      git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
      # ruby
      rbenv install 2.5.5
      rbenv global 2.5.5
EOF
  SHELL
end

=begin

  apt-get install -y ruby-build
    sudo su - vagrant <<EOF
EOF
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
