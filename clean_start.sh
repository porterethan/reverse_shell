OLD_IMAGE=$(docker image ls | grep ubuntu_hw | awk '{print $1}')
OLD_PROCESS=$(docker container ps | grep ubuntu-os-hw | awk '{print $12}')
echo $OLD_PROCESS

if [ "$OLD_PROCESS" == "ubuntu-os-hw" ]; then
    echo "Stop running ubuntu-os-hw container"
    docker container stop ubuntu-os-hw
fi

if [ "$OLD_IMAGE" == "ubuntu_hw" ]; then
    echo "Remove the existing ubuntu_hw docker image"
    docker image rm -f ubuntu_hw
else
    echo "NO ubuntu_hw image"
fi

echo "Build the ubuntu_hw docker image"
docker build -t ubuntu_hw .

echo "Run the docker container ubuntu-os-hw"
docker run -itd -p8888:8888 --rm --name ubuntu-os-hw -v"$PWD/share":/home/app ubuntu_hw

echo "If you want to enter the bash shell, enter the command"
echo "docker exec -it ubuntu-os-hw /bin/bash"

echo "You can use VSCode in your {path_github_repo}\share in your host OS"