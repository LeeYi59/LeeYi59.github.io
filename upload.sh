#!/bin/bash

echo '开始推送.....' && \
git add . && \
git commit -m "提交" && \
git push origin hexo && \
echo '推送完成.....'
