vagrant-centos-dev-001
======================

centosをベースに作成したvagrant

## 手順
### git clone
```
$ git clone https://github.com/mshige1979/vagrant-centos-dev-001.git
```

### ディレクトリを移動して「vagrant up」
```
$ cd  vagrant-centos-dev-001
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

### 作成したあとのパッケージbox
容量が結構あるので公開はちょっと保留
```
https://docs.google.com/uc?export=download&confirm=yQmr&id=0B3FpUg6c-uqRUmNBRGFDUGRKazg
```
配置したけど一度ダウンロードしてからでないと使えないかも
wgetとかでは正しくダウンロードできないのでブラウザ経由でダウンロードする必要がある


