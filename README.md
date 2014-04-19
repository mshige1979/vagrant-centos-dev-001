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
<a href="http://f.hatena.ne.jp/m_shige1979/20140419120811"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120811.jpg" alt="20140419120811"></a>

<a href="http://f.hatena.ne.jp/m_shige1979/20140419120812"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120812.jpg" alt="20140419120812"></a>

<a href="http://f.hatena.ne.jp/m_shige1979/20140419120813"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120813.jpg" alt="20140419120813"></a>

<a href="http://f.hatena.ne.jp/m_shige1979/20140419120814"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120814.jpg" alt="20140419120814"></a>

<a href="http://f.hatena.ne.jp/m_shige1979/20140419120815"><img src="http://img.f.hatena.ne.jp/images/fotolife/m/m_shige1979/20140419/20140419120815.jpg" alt="20140419120815"></a>

### パラメータを設定

## 初期処理完了







