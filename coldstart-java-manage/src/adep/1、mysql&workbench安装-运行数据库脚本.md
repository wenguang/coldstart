
官方下载mysql&workbench的dmg来安装即行
这里的目录是：/usr/local/mysql-8.0.11-macos10.13-x86_64（命令在/usr/local/mysql/bin，端口3306）

编辑~/.bash_profile，添加path路径
#mysql
PATH=$PATH:/usr/local/mysql/bin

#登陆mysql
mysql -u root -p

登陆成功，但是运行命令的时候会报错，提示我们需要重设密码。
mysql> show databases;ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.mysql>

set PASSWORD =PASSWORD('xxxxxxx');

安装完后可以系统偏好设置->mysql面板启动，用workbench连接

[mac 安装mysql详细教程](https://www.jianshu.com/p/07a9826898c0)