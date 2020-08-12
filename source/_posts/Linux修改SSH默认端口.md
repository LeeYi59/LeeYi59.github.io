---
title: Linux修改SSH默认端口
date: 2020-08-05 17:24:52
tags:
- Linux
categories:
- Linux
---

找到/etc/ssh 目录，修改sshd_config文件

<!--more-->

```shell
vi /etc/ssh/sshd_config
```

找到`post`,修改成指定端口

<font color=#A52A2A size=4 >注：修改前确认端口没有被占用</font>

