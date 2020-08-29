URI にプレフィックス(ID)を付加する PowerShell スクリプト

■ これは何
URI にプレフィックス(ID)を付加するスクリプトです

Microsoft MVP イベントの一つで「MVP Docs & Learn Champion」ってイベントがあって、URI に Creator ID を付加したものを使うのですが、その手間を削減するために作りました。

おまけ機能で、Facebook が URI に付ける「?fbclid=」を削除するようにしています。

ちなみに、このスクリプトのインストールと実行には管理権限は不要です。

■ 使い方
スクリプトのインストールが完了すると、デスクトップに「SetPrefix4URI」というショートカットが作られます。

Web ブラウザの URI をクリップボードにコピーして、作成されたショートカットをダブルクリックすると、プレフィックスを付加した URI がクリップボードにセットされます。

プレフィックスセット前と、セット後の URI が確認できる画面が開き、「Please Enter:」で Enter 待ちになるので、Enter キーを叩くと画面が閉じます。

ちなみに、Web ブラウザの URI をクリップボード コピーするには、Ctrl+L でWeb ブラウザのアドレスバーを選択し、Ctrl+C するのが手っ取り早いです。


■ インストール方法(Windows)
まずは PowerShell を起動します
PowerShell を起動するには、スタートメニューを右クリックして Windows PowerShell を選択します。

以下インストールコマンドを PowerShell にペーストしてください(マウス右クリックでペーストできます)


$Terget = "C:\Script"
if(-not (Test-Path $Terget)){ md $Terget }
$GitPath = "https://raw.githubusercontent.com/MuraAtVwnet/SetPrefix4URI/master/"

$GetFile = "Install_Win.ps1"
Invoke-WebRequest -Uri ($GitPath + $GetFile) -OutFile (Join-Path $Terget $GetFile)

$GetFile = "SetPrifix4URI.bat"
Invoke-WebRequest -Uri ($GitPath + $GetFile) -OutFile (Join-Path $Terget $GetFile)

$GetFile = "Install_Win.bat"
$InstallBatPath = Join-Path $Terget $GetFile
Invoke-WebRequest -Uri ($GitPath + $GetFile) -OutFile $InstallBatPath

. $InstallBatPath

$GetFile = "SetPrefix4URI.ps1"
$ScriptPath = Join-Path $Terget $GetFile
Invoke-WebRequest -Uri ($GitPath + $GetFile) -OutFile $ScriptPath

notepad $ScriptPath


インストールコマンドをペーストすると、デスクトップに「SetPrifix4URI」のショートカットが作成され、メモ帳で「SetPrefix4URI.ps1」が開かれます。

「SetPrefix4URI.ps1」の $Prefix に Creator ID をセットして保存すれば準備完了です。

プレフィックス確認を表示しないようにする場合は、$DisplayURI に $false をセットします。

設定を再編集する場合は、"C:\Script\SetPrefix4URI.ps1" をメモ帳などのテキストエディタで編集してください。

■ Mac での利用
プレフィックスを付ける SetPrefix4URI.ps1 は PowerShell Core(7.3 で動作確認)でも動作するので、Mac OS でも機能すると思いますが、Windows のようにデスクトップにショートカットを作って簡単に .ps1 を動かす方法不明だったのでインストーラー等が準備出来ていません。


■ リポジトリ
このスクリプトは Github で公開していますので、ご入用の方は Clone してください

git@github.com:MuraAtVwnet/SetPrefix4URI.git
https://github.com/MuraAtVwnet/SetPrefix4URI


■ Web ページ
Windows インストール方法の画面付き説明は以下ページを見てください。

URI にプレフィックス(ID)を付加する PowerShell スクリプト
http://www.vwnet.jp/Windows/PowerShell/2020082901/SetPrefix4URI.htm

