#!/bin/bash

echo '开始拉取新版本文件' && \
git pull origin hexo && \
echo '拉取成功，开始清理原有文件' && \
hexo clean && \
echo '清理完成,开始生成新文件' && \
hexo g && \
echo '生成完毕,开始文件推送' && \
hexo d && \
echo '推送成功'
