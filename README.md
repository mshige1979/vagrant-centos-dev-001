vagrant-centos-dev-001
======================

centosをベースに作成したvagrant
これはcakephp3ようにカスタマイズする予定

## 補足
ユーザー/パスワード ：vagrant / vagrant


## 手順
### git clone
```
$ git clone https://github.com/mshige1979/vagrant-centos-dev-001.git -b cakephp3.x cakephp3.x
```

### ディレクトリを移動して「vagrant up」
```
$ cd  cakephp3.x
$ vagrant up
```

### しばらく待つ必要があります

### やっていること
* yum update
* yum -y groupinstall "Development Tools"
* リポジトリ登録
* git最新化
* vimインストール
* perl(plenv)
* php5.5
* node
* ruby
* nginx
* supervisord






