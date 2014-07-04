vagrant-centos-dev-001(apache-mt6.0.3)
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
$ git clone https://github.com/mshige1979/vagrant-centos-dev-001.git -b apache-mt6.0.3 apache-mt6.0.3
```

### ディレクトリを移動して「vagrant up」
```
$ cd  apache-mt6.0.3
$ vagrant up
```

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
* httpd
* mt6

### メモリ変更
```
  # provider
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
```
で環境の仮想メモリを2GBへ変更可能



