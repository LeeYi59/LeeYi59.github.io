---
title: Docker配置镜像加速器
date: 2020-08-13 11:06:06
tags:
- Docker
categories:
- Docker
---

使用阿里云镜像加速器,加快Docker下载速度

<!--more-->

登录阿里云后台->搜索容器镜像服务->点击左下角镜像加速器

{% asset_img Image.png%}

复制加速器地址，在/etc/docker/下创建daemon.json,添加

```json
{ "registry-mirrors": ["https://5nykq2ld.mirror.aliyuncs.com"] }
```

或者直接复制下方代码，运行
```shell
sudo mkdir -p /etc/docker sudo tee /etc/docker/daemon.json <<-'EOF'
 { "registry-mirrors": ["https://5nykq2ld.mirror.aliyuncs.com"] } 
EOF 
sudo systemctl daemon-reload 
sudo systemctl restart docker
```