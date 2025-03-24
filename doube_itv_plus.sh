#!/bin/bash
clear
docker ps -a
echo ""
echo ""

# 可以写死镜像名字
name="doube-itv-plus"

# 如果写死镜像名字，注释下面这行代码
# read -p "输入上面itv-plus镜像的NAMES或者CONTAINER ID: " name
echo "您输入的内容是: $name"
curl -O https://json.doube.eu.org/doube_itv_plus.py
if [ $? -eq 0 ]; then
    docker cp ./doube_itv_plus.py $name:/app
    docker exec -it $name python3 /app/doube_itv_plus.py
    docker restart $name
    rm doube_itv_plus.py
    echo "重启 $name 镜像成功"
else
    echo "文件下载失败"
fi




