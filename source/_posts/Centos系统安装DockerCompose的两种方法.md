---
title: Centos系统安装DockerCompose的两种方法
date: 2020-08-12 17:18:16
tags:
- DockerCompose
- Docker
- Centos
categories:
- Docker
---

总结两种安装DockerCompose 的方法

<!--more-->

**方法1:**

从docker的github仓库上下载docker-compose资源，这个方法适用于网络好的或者可以翻出去的人。

拉取docker-compose资源

```shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

设置权限，以便可执行

```shell
sudo chmod +x /usr/local/bin/docker-compose
```

设置软链接

```shell
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

测试结果

```shell
docker-compose --version
```

显示`cker-compose version 1.24.1, build 4667896b`则成功



**方法2：**

使用python-pip安装。这个方法适用于网络不好无法拉取docker-compose资源的人。
<font style="color:red;">提示：此方法不推荐使用，除非第一种方法实在无法实现。因为安装后会附带大量pip相关依赖，对环境的纯净度会所影响。</font>

安装python-pip

```shell
yum -y install epel-release
yum -y install python-pip
```

安装docker-compose

```shell
pip install docker-compose
```

待安装完成后，执行查询版本的命令，即可安装docker-compose

```shell
docker-compose version
```