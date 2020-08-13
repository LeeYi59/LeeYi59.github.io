---
title: Docker常用命令
date: 2020-08-13 11:43:53
tags:
- Docker
categories:
- Docker
---

**运行一个容器**

```shell
docker run -i -t ubuntu:15.10 /bin/bash
```
`-i`：打开伪终端 
`-t`：允许输入信息交互
`-d`：后台运行
`-p`：将端口映射到主机上

<!--more-->

如

```shell
docker run -d -p 主机端口:容器端口 training/webapp python app.py
```
将容器内5000端口映射到主机的5000端口
`-P` :是容器内部端口随机映射到主机的高端口。
`-p` : 是容器内部端口绑定到指定的主机端口。
```shell
docker run -v 数据卷名称或者主机路径:容器内路径
```
`-v`：指定数据卷 ，如果指定路径则会自动创建一个数据卷

`--name`：指定容器名称，如
```shell
docker run -itd --name ubuntu-test ubuntu
```
将容器名命名为ubuntu-test也可直接输入`-itd`代替`-i` `-t` `-d`

**查看运行中的docker容器列表**

```shell
docker ps
```

 `-a`：查看所有状态下的容器
`-l`：查看最后一次创建的容器
`-q`：只查看容器得到的标识

**查看docker容器日志**

```shell
docker logs 容器id/容器名称
```
可加`-f`跟随尾部输出日志

**.停止一个docker容器**

```shell
docker stop 容器id/容器名称
```

**开启一个或多个docker容器**

```shell
docker start 容器id/容器名称
```
**重启docker容器**

```shell
docker restart 容器id/容器名称
```

****
**适用于正在运行中的容器**

**进入docker容器**
```shell
docker attach 容器id/容器名称
```
```shell
docker exec 容器id/容器名称 
```
推荐使用`docker exec`,
`docker attach`进入容器后使用`exit`命令会导致docker容器停止，`docker exec`则不会

**导出本地容器快照文件**

```shell
docker export 容器id/容器名称 > 输出文件.tar
```

**将快照文件导入到镜像中**
```shell
cat docker/ubuntu.tar | docker import - test/ubuntu:v1
```
将docker/ubuntu.tar导入到镜像test/ubuntu:v1中

**通过从其他url中导入**
```shell
docker import http://example.com/exampleimage.tgz example/imagerepo
```

**删除容器**
```shell
docker rm -f 容器id/容器名称
```
<font color="red">注：删除容器时，容器必须是停止状态，否则会报错</font>

**清除所有已终结的容器**
```shell
docker container prune
```
如果询问就是选yes

**查看容器端口占用**
```shell
docker port 容器id/容器名称     
```

**查看容器内部进程**

```shell
docker top 容器id/容器Name
```

**查看容器底层信息**

```shell
docker inspect 容器id/容器Name
```

**从仓库拉取镜像**

```shell
docker pull 镜像名:版本号
```
**删除镜像**

```shell
docker rmi 镜像名
```

**更新镜像**

以ubuntu:15.10为例，我们希望得到更新的ubuntu系统先把镜像在容器中运行
```shell
docker run -t -i ubuntu:15.10 /bin/bash
```
在容器中执行`apt-get update`进行系统更新，完成后`exit`退出容器接着执行
```shell
docker commit -m="更新" -a="lee" 容器id runoob/ubuntu:v2
```
将ubuntu容器提交成为镜像runoob/ubuntu:v2
`-m`: 提交的描述信息
`-a`: 指定镜像作者

**创建镜像**
需要一个 Dockerfile文件 ，其中包含一组指令来告诉 Docker 如何构建我们的镜像，具体内容这里不详解。使用`docker build`创建镜像
```shell
docker build -t 镜像名:版本号 .
```
`-t` ：指定要创建的目标镜像名
`.` ：Dockerfile 文件所在目录，可以指定Dockerfile 的绝对路径

**复制一个镜像到新的版本镜像**

```shell
docker tag 镜像id 新镜像名:版本号
```

**保存本地镜像到文件**

```shell
docker save -o 导出的路径 镜像id
```

**加载本地镜像文件**

```shell
docker load -i 镜像文件
```

**修改镜像名称**

```shell
docker tag 镜像id 新镜像名称:版本
```

**创建数据卷**

```shell
docker volume create 数据卷名称
```
创建数据卷之后，会默认存放在一个目录下 /var/lib/docker/volumes/数据卷名称/_data

**查看全部数据卷**

```shell
docker volume ls
```

**查看数据卷详细信息**

```shell
docker volume inspect 数据卷名称
```

**删除数据卷**

```shell
docker volume rm 数据卷名称
```