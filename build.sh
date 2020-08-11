#!/bin/bash

echo '开始清理原有文件' && \
hexo clean && \
echo '清理完成,开始生成新文件' && \
hexo g && \
echo '生成完毕,开始文件推送' && \
hexo d && \
echo '推送成功，开始执行git推送脚本' && \
sh ./upload.sh 
