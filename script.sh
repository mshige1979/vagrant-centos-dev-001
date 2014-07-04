#!/bin/sh

# iptables off
sudo chkconfig iptables off
sudo service iptables stop

# epel,remi
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# developer
sudo yum -y update
sudo yum -y groupinstall "Development Tools"

cd /etc/yum.repos.d/
sudo wget http://wing-repo.net/wing/6/EL6.wing.repo
sudo wget http://wing-repo.net/wing/extras/6/EL6.wing-extras.repo
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
sudo git clone git://github.com/tokuhirom/plenv.git /usr/local/plenv
sudo git clone git://github.com/tokuhirom/Perl-Build.git /usr/local/plenv/plugins/perl-build

sudo echo '' >> /etc/profile
sudo echo 'export PATH="/usr/local/plenv/bin:$PATH"' >> /etc/profile
sudo echo 'export PLENV_ROOT=/usr/local/plenv' >> /etc/profile
sudo echo 'eval "$(plenv init -)"' >> /etc/profile
sudo chown vagrant.vagrant -R /usr/local/plenv

source /etc/profile

plenv install 5.18.1
plenv global 5.18.1
sudo chown vagrant.vagrant -R /usr/local/plenv

plenv install-cpanm
sudo chown vagrant.vagrant -R /usr/local/plenv

sudo rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
sudo yum -y --enablerepo=epel install re2c libmcrypt libmcrypt-devel
sudo yum -y install libxml2-devel bison bison-devel openssl-devel curl-devel libjpeg-devel libpng-devel libmcrypt-devel readline-devel libtidy-devel libxslt-devel httpd-devel enchant-devel libXpm libXpm-devel freetype-devel t1lib t1lib-devel gmp-devel libc-client-devel libicu-devel oniguruma-devel net-snmp net-snmp-devel  bzip2-devel
sudo yum -y install php55w php55w-bcmath php55w-cli php55w-common php55w-dba php55w-devel php55w-embedded php55w-enchant php55w-fpm php55w-gd php55w-imap php55w-interbase php55w-intl php55w-ldap php55w-mbstring php55w-mcrypt php55w-mssql php55w-mysql php55w-odbc php55w-opcache php55w-pdo php55w-pear.noarch php55w-pecl-apcu php55w-pecl-apcu-devel php55w-pecl-memcache php55w-pecl-xdebug php55w-pgsql php55w-process php55w-pspell php55w-recode php55w-snmp php55w-soap php55w-tidy php55w-xml php55w-xmlrpc

# node
sudo yum -y install nodejs npm --enablerepo=epel

# ruby
sudo yum -y install ruby ruby-devel ruby-docs rubygems

# mysql
sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo yum -y install mysql mysql-devel mysql-server mysql-utilities
sudo service mysqld start
sudo chkconfig mysqld on

# perl cpanm
cd /vagrant
perl /usr/local/plenv/shims/cpanm --installdeps .

# mt
cd /vagrant/
wget https://www.dropbox.com/s/7oy86ddjypkioa8/MT-6_0_3.zip
mv MT-6_0_3.zip /tmp/.
cd /tmp/
unzip MT-6_0_3.zip

# mkdir
sudo mkdir -p /var/www/vhosts/mt6.example.com/html
sudo mkdir -p /var/www/vhosts/mt6.example.com/cgi-bin
sudo mkdir -p /var/www/vhosts/mt6.example.com/logs

# move
sudo mv MT-6.0.3/ /var/www/vhosts/mt6.example.com/cgi-bin/mt
sudo mv /var/www/vhosts/mt6.example.com/cgi-bin/mt/mt-static /var/www/vhosts/mt6.example.com/html

# env
cd /var/www/vhosts/mt6.example.com/cgi-bin/mt

mv mt.psgi         mt.psgi.org
mv mt-atom.cgi     mt-atom.cgi.org
mv mt.cgi          mt.cgi.org
mv mt-check.cgi    mt-check.cgi.org
mv mt-comments.cgi mt-comments.cgi.org
mv mt-cp.cgi       mt-cp.cgi.org
mv mt-data-api.cgi mt-data-api.cgi.org
mv mt-feed.cgi     mt-feed.cgi.org
mv mt-ftsearch.cgi mt-ftsearch.cgi.org
mv mt-search.cgi   mt-search.cgi.org
mv mt-sp.cgi       mt-sp.cgi.org
mv mt-tb.cgi       mt-tb.cgi.org
mv mt-testbg.cgi   mt-testbg.cgi.org
mv mt-upgrade.cgi  mt-upgrade.cgi.org
mv mt-wizard.cgi   mt-wizard.cgi.org
mv mt-xmlrpc.cgi   mt-xmlrpc.cgi.org

sed -e 's/#!\/usr\/bin\/perl/#!\/usr\/local\/plenv\/shims\/perl/g'    mt.psgi.org         > mt.psgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-atom.cgi.org     > mt-atom.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt.cgi.org          > mt.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-check.cgi.org    > mt-check.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-comments.cgi.org > mt-comments.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-cp.cgi.org       > mt-cp.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-data-api.cgi.org > mt-data-api.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-feed.cgi.org     > mt-feed.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-ftsearch.cgi.org > mt-ftsearch.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-search.cgi.org   > mt-search.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-tb.cgi.org       > mt-tb.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-sp.cgi.org       > mt-sp.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-testbg.cgi.org   > mt-testbg.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-upgrade.cgi.org  > mt-upgrade.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-wizard.cgi.org   > mt-wizard.cgi
sed -e 's/#!\/usr\/bin\/perl -w/#!\/usr\/local\/plenv\/shims\/perl/g' mt-xmlrpc.cgi.org   > mt-xmlrpc.cgi

sudo chmod +x *.cgi
sudo chown apache.apache /var/www/vhosts/mt6.example.com/ -R

# httpd
sudo service httpd start
sudo chkconfig httpd on
sudo cp -p /vagrant/httpd.conf /etc/httpd/conf/httpd.conf

