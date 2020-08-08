---
title: Linux用户和用户组操作
date: 2020-08-05 17:40:11
tags:
- Linux
categories:
- Linux
---

### ## 用户和用户组操作
**创建用户**

```shell
useradd [-cgd] [选项指定的具体内容] [用户名]
```

` -c`: 代表comment，给用户添加一段注释

`-g`：代表group，可以修改用户的所在组 

`-d`：代表指定用户的home目录

**设置密码** 

```shell
passwd 用户名
```

切换用户su 用户名切换后自动跳转到该用户的home目录下#代表该用户为超级管理员$代表该用户为普通用户
修改用户usermod [-cgd] [选项指定的具体内容] 用户名-c: 代表comment，给用户添加一段注释-g：代表group，可以修改用户的所在组 -d：代表指定用户的home目录
删除用户userdel [-r] 用户名-r：代表删除用户的同时，删除该用户的home目录
查看用户组成员groups 用户组名
创建用户组groupadd 用户组名
修改用户组groupmond [-n] [选项指定的具体内容] 用户组名-n：修改用户组名称
删除用户组groupdel 用户组名只能删除不存在用户的用户组