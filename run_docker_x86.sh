#！/bin/bash

container_name="jcc"
domain_id="10"

if [ $(docker ps -aq) != "" ]; then
  docker stop $container_name
  docker rm $container_name
fi

local_path=$(dirname $(readlink -f "$0"))
# workspace=$(dirname ${local_path})
workspace=$(dirname $(readlink -f "$0"))
docker_path="/workspace"

# 加载配置参数
# source $local_path/$1/start.conf

echo "x86 docker..."
echo "local_path:" $local_path
echo "workspace:" $workspace
echo "docker_path:" $docker_path

# 运行autoware容器
docker run -it  -e DISPLAY=$DISPLAY \
                -e NVIDIA_VISIBLE_DEVICES=all \
		-e NVIDIA_DRIVER_CAPABILITIES=all \
                -e ROS_DOMAIN_ID=$domain_id \
                --gpus all \
		--net host \
		--privileged \
                --name=$container_name \
		-w $docker_path \
                -v /tmp/.X11-unix/:/tmp/.X11-unix \
                -v $workspace:$docker_path \
                -v /etc/localtime:/etc/localtime:ro \
                registry.cn-hangzhou.aliyuncs.com/xustjcc/xustjcc:20251015-x86  \
                /bin/bash \



