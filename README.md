vagrant-centos-dev-001
======================

centosをベースに作成したvagrant
MovableTypeを動作するように追加

## 補足
ユーザー/パスワード ：vagrant / vagrant

## hosts追加
```
192.168.33.10   mt6.example.com
```
を追加しておく

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

↓<br />
↓<br />
↓<br />
↓<br />
↓<br />
↓<br />

### 指定のディレクトリへ移動してboxを配置して、追加
```
mkdir test2
cd test2
vagrant add centos-dev-001 centos-dev-001.box
```

### 初期化
```
vagrant init centos-dev-001
```

### 起動
```
vagrant up
```
※ここでは127.0.0.1:2222でしか接続できない

### この状態ではprivateのnetworkなどが使えないのでnetwork設定を対応
```
vim /etc/udev/rules.d/70-persistent-net.rule
----
# PCI device 0x8086:0x100e (e1000)
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:c9:39:9e", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"

# PCI device 0x8086:0x100e (e1000)
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:8f:2d:17", ATTR{type}=="1", KERNEL=="eth*", NAME="eth1"
----
↓以下へ変更（erth1の項目を削除）
----
# PCI device 0x8086:0x100e (e1000)
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:c9:39:9e", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
----
```

### Vagrantfileで以下をコメント解除
```
config.vm.network "private_network", ip: "192.168.33.10"
```

### 再起動
```
vagrant reload
```
で192.168.33.10での接続が動作するはず




