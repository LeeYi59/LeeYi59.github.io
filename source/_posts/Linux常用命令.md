---
title: Linux系统常用命令
date: 2020-08-05 15:34:57
tags:
- Linux
- 命令行
categories:
- Linux
---

在我使用linux过程中，shell命令之多令人震惊，此文用以记录经常使用的那些命令。（持续更新）

<!--more-->

## ## 系统常用命令

**查看cpu使用情况**

```shell
top -bn 1 -i -c
```

**查看系统版本**

```shell
cat /proc/version
```

**查看进程**

```shell
ps -ef
```

**查看运行中的进程**

```shell
ps -ef | grep [搜索的内容]
```

**检查服务运行状态**

```shell
service [服务名] status
```

**查看服务状态**

```shell
systemctl start|stop|restart|enable|disable|status [服务名]
```

分别对应 启动，停止，重启，开机自动启动，禁止开机自动启动

**查看端口占用情况**

有些系统需要先下载`net-tools`,这里使用`yum`安装

```shell
yum -y install net-tools
```

查看具体端口号,加`|grep`

```shell
netstat -lnp|grep [端口号]
```

**需要端口情况具体情况**

```shell
netstat -naop | grep [端口号]
```

**下载**

```shell
curl [文件远程地址]
```

**查看文件**

```shell
find [路径] -type -f | grep [文件名]
```

`-type`：表示按类型查找

-`f`：类型为文件

`grep`：指定搜索文件

