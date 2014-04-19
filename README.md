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
$ git clone https://github.com/mshige1979/vagrant-centos-dev-001.git -b mt6.0.3 mt6.0.3
```

### ディレクトリを移動して「vagrant up」
```
$ cd  mt6.0.3
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
* MT6.0.3のインストール（初期設定は手動）

## MT設定
### http://mt6.example.com/cgi-bin/mt/mt.cgi へアクセス
<a href="http://f.hatena.ne.jp/m_shige1979/20140419120811"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120811.jpg" alt="20140419120811" width="600"></a>

### ウェブサイトを設定
<a href="http://f.hatena.ne.jp/m_shige1979/20140419120812"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120812.jpg" alt="20140419120812" width="600"></a>

### データベースの初期化
<a href="http://f.hatena.ne.jp/m_shige1979/20140419120813"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120813.jpg" alt="20140419120813" width="600"></a>

### ログイン
<a href="http://f.hatena.ne.jp/m_shige1979/20140419120814"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120814.jpg" alt="20140419120814" width="600"></a>

### ダッシュボードを表示
<a href="http://f.hatena.ne.jp/m_shige1979/20140419120815"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120815.jpg" alt="20140419120815" width="600"></a>

## /etc/hosts 編集
```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 mt6.example.com
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
```
とする
mt-check.cgiが正しく動作しないため、/etc/hostsを編集することが必要








