#!/bin/sh

# update apt repository
apt-get update

# tools
apt-get install -y emacs

# postgres
apt-get install -y postgresql
systemctl enable postgresql.service

# create a database for vagrant
/etc/init.d/postgresql start
sudo -u postgres createuser -d vagrant
sudo -u postgres createdb vagrant
/etc/init.d/postgresql stop

# install heroku tool belt
snap install --classic heroku

# ruby
apt-get install -y autoconf bison build-essential \
  libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
  libncurses5-dev libffi-dev libgdbm5 libgdbm-dev \
  libpq-dev

sudo su - vagrant <<'EOF'
  cd ~

  # rbenv
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH=~/.rbenv/bin:$PATH' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc

  # ruby-build
  mkdir -p ~/.rbenv/plugins
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

  # install ruby
  ~/.rbenv/bin/rbenv install 2.5.5
  ~/.rbenv/bin/rbenv global 2.5.5

  ~/.rbenv/shims/gem install rails
EOF
