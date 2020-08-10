---
title: Linux禁止休眠
date: 2020-08-10 15:47:41
tags:
- Linux
- 命令行
categories:
- Linux
---

### ## Linux禁止休眠

最近重装了centos7，只用了终端版，并没有使用界面，但还是发现待机一段时间后就会关闭屏幕，断开网络，挣扎了很久。

最后发现，可以通过修改修改X11的配置来实现禁止自动休眠，配置文件为/etc/X11/xorg.conf

<font style="color:red">注：如果原来是没有的，相当于新建了一个，如果原来有这个文件，请做好备份，据说，是据说可能会由于配置错误导致无法进行X11桌面.</font>

<!--more-->

```shell
vi /etc/X11/xorg.conf
```

修改涉及两个地方

1.  Section "Monitor"：找到Section "Monitor"，查看其配置中是否有 DPMS，且其值为 false，保证配置信息如下：

   ```shell
   Section "Monitor"
       Option "DPMS" "false"
   EndSection
   ```

2.  新增一个Section "ServerFlags"，包含的内容如下：

   ```shell
   Section "ServerFlags"
       Option      "BlankTime" "0"
       Option      "StandbyTime" "0"
       Option      "SuspendTime" "0"
       Option      "OffTime" "0"
   EndSection
   ```

   