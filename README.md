vagrant-centos-dev-001
======================

centosをベースに作成したvagrant

## 補足
ユーザー/パスワード ：vagrant / vagrant

## 準備
```
vagrant plugin install vagrant-vbguest
vagrant plugin install sahara
```

## 手順
### git clone
```
$ git clone https://github.com/mshige1979/vagrant-centos-dev-001.git -b test00 test00
```

### ディレクトリを移動して「vagrant up」
```
$ cd test00
$ vagrant up
```

### しばらく待つ必要があります

### やっていること
* yum update
* yum -y groupinstall "Development Tools"
* リポジトリ登録
* git最新化
* vimインストール



