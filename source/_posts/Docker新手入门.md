---
title: Docker新手入门
date: 2020-08-12 11:31:01
top: true
tags:
- Docker
categories:
- Docker
---

最近需要给多个用户部署项目，为了方便管理不同的环境和数据库，开始了Docker的学习之旅。

<!--more-->

Docker是一个运行应用程序的开放平台，能够将一个或多个程序放在不同的`容器`中运行，容器环境完全以沙盒方式运行，实现容器环境与主机基础框架隔离。

Docker的引入提高了单一主机环境下部署程序的灵活性和资源的利用率，大大减少了开发时长和开发成本。

Docker的几个基本概念（节选自菜鸟教程）：

- **镜像（Image）**：Docker 镜像（Image），就相当于是一个 root 文件系统。比如官方镜像 ubuntu:16.04 就包含了完整的一套 Ubuntu16.04 最小系统的 root 文件系统。

- **容器（Container）**：镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。

- **仓库（Repository）**：仓库可看成一个代码控制中心，用来保存镜像。

{% asset_img  576507-docker1.png %}

接下来为大家分享一些Docker基础入门操作。

**首先是在Centos下安装Docker：**{% post_link Centos系统安装Docker %}

**Docker的一些常见命令：**{% post_link Docker常用命令 %}

Docker的使用步骤：一般为 `获取/建立镜像`->`使用镜像创建容器`->`运行容器`

这里以mysql为例：

**拉取mysql5.7**

```shell
docker pull mysql:5.7
```

**运行mysql，并把root账号密码初始化为123456，将容器中3306端口映射到宿主机的13306端口上**

```shell
docker run -itd --name mysql-test -p 13306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7
```
`MYSQL_ROOT_PASSWORD`:设置密码

**查看docker容器运行情况**

```shell
docker ps
```

**进入容器：**

```shell
docker exec -it 62349aa31687 /bin/bash
```

在学习了熟练使用docker之后，发现了一个问题。
就是每次修改容器配置信息时都要进行容器删除、容器新建，同时附带很多参数，很不方便。
如果遇到需要同时修改多个的情况，那就更恐怖了。

这个时候就该使用DockerCompose，统一管理容器。

**这是DockerCompose的安装教程：**{% post_link Centos系统安装DockerCompose的两种方法 %}

<font style="color:blue">常见问题：</font>
如果安装完毕后出现拉取镜像失败的情况，可通过配置`镜像加速器`来加快连接速度。

**配置镜像加速：**{% post_link Docker配置镜像加速器 %}

