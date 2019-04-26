

##### 安装
官方下载压缩包，解压，进入解压目录
make test
sudo make install

安装目录/usr/local/redis-4.0.10（命令在/usr/local/bin目录下，端口6379），既然命令在/usr/local/bin，就不用编辑~/.bash_profile添加path路径了。若/usr/local/bin没有相关命令，就把/usr/local/redis-4.10.0/src目录下的mkreleasehdr.sh，redis-benchmark， redis-check-rdb， redis-cli， redis-server拷贝到/usr/local/bin目录

redis-server redis服务器
redis-cli redis客户端
redis-benchmark redis性能测试工具
redis-check-aof AOF文件修复工具
redis-check-rdb RDB文件修复工具


##### 开启redis
sudo redis-server 或
sudo redis-server 配置文件路径

##### 连接redis
sudo redis-cli（默认配置连接redis）或
sudo redis-cli -h ip -p port（指定地址和端口号）

##### 关闭redis
ps axu|grep redis  ## 查找redis-server的PID
 kill -9 PID


参考：[mac下redis安装、设置、启动停止](https://www.cnblogs.com/shoren/p/redis.html)


##### 以下是配置文件的一些配置项目的参考，具体配置值见解压目录下redis.conf
```
#修改为守护模式
daemonize yes

#设置进程锁文件
pidfile /usr/local/redis/redis.pid

#端口
port 6379

#客户端超时时间
timeout 300

#日志级别
loglevel debug

#日志文件位置
logfile /usr/local/redis/log-redis.log

#设置数据库的数量，默认数据库为16，可以使用SELECT 命令在连接上指定数据库id
databases 16

##指定在多长时间内，有多少次更新操作，就将数据同步到数据文件，可以多个条件配合
#save

#Redis默认配置文件中提供了三个条件：
save 900 1
save 300 10
save 60 10000

#指定存储至本地数据库时是否压缩数据，默认为yes，Redis采用LZF压缩，如果为了节省CPU时间，
#可以关闭该#选项，但会导致数据库文件变的巨大
rdbcompression yes

#指定本地数据库文件名
dbfilename dump.rdb

#指定本地数据库路径
dir /usr/local/redis/db/

#指定是否在每次更新操作后进行日志记录，Redis在默认情况下是异步的把数据写入磁盘，如果不开启，可能
#会在断电时导致一段时间内的数据丢失。因为 redis本身同步数据文件是按上面save条件来同步的，所以有
#的数据会在一段时间内只存在于内存中
appendonly no

#指定更新日志条件，共有3个可选值：
#no：表示等操作系统进行数据缓存同步到磁盘（快）
#always：表示每次更新操作后手动调用fsync()将数据写到磁盘（慢，安全）
#everysec：表示每秒同步一次（折衷，默认值）
appendfsync everysec
```


