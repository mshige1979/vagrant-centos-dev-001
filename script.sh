#!/bin/sh

# epel,remi
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# developer
sudo yum -y update
sudo yum -y groupinstall "Development Tools"

cd /etc/yum.repos.d/
wget http://wing-repo.net/wing/6/EL6.wing.repo
wget http://wing-net.ddo.jp/wing/extras/6/EL6.wing-extras.repo
sudo yum clean all
sudo yum -y install yum-priorities

# git
sudo yum -y remove git
sudo yum -y install git --enablerepo=wing

# ntp
sudo yum -y install ntp
sudo service ntpd start
sudo chkconfig ntpd on

# vim
sudo yum -y install vim

# plenv
git clone git://github.com/tokuhirom/plenv.git /usr/local/plenv
git clone git://github.com/tokuhirom/Perl-Build.git /usr/local/plenv/plugins/perl-build

sudo echo '' >> /etc/profile
sudo echo 'export PATH="/usr/local/plenv/bin:$PATH"' >> /etc/profile
sudo echo 'export PLENV_ROOT=/usr/local/plenv' >> /etc/profile
sudo echo 'eval "$(plenv init -)"' >> /etc/profile
sudo chown vagrant.vagrant -R /usr/local/plenv

source /etc/profile

plenv install 5.18.1
plenv global 5.18.1
plenv install-cpanm

sudo rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
sudo yum -y --enablerepo=epel install re2c libmcrypt libmcrypt-devel
sudo yum -y install libxml2-devel bison bison-devel openssl-devel curl-devel libjpeg-devel libpng-devel libmcrypt-devel readline-devel libtidy-devel libxslt-devel httpd-devel enchant-devel libXpm libXpm-devel freetype-devel t1lib t1lib-devel gmp-devel libc-client-devel libicu-devel oniguruma-devel net-snmp net-snmp-devel  bzip2-devel
sudo yum -y install php55w php55w-opcache

# node
sudo yum -y install nodejs npm --enablerepo=epel

# ruby
sudo yum -y install ruby ruby-devel ruby-docs rubygems

# mysql
sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo yum -y install mysql mysql-devel mysql-server mysql-utilities
sudo service mysqld start
sudo chkconfig mysqld on

sudo rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
sudo yum -y install nginx --enablerepo=nginx
sudo service nginx start
sudo chkconfig nginx on

sudo yum -y install supervisor
sudo service supervisord start
sudo chkconfig supervisord on

cd /vagrant
perl /usr/local/plenv/shims/cpanm --installdeps .

sudo mkdir -p /var/log/nginx/dev.example.com

