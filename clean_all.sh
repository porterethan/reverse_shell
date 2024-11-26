OLD_IMAGE=$(docker image ls | grep ubuntu-hw | awk '{print $1}')
OLD_PROCESS=$(docker container ps | grep ubuntu-os-hw | awk '{print $12}')
echo $OLD_PROCESS

if [ "$OLD_PROCESS" == "ubuntu-os-hw" ]; then
    echo "Stop running ubuntu-os-hw container"
    docker container stop ubuntu-os-hw
fi

if [ "$OLD_IMAGE" == "ubuntu-hw" ]; then
    echo "Remove the existing ubuntu-hw docker image"
    docker image rm -f ubuntu-hw
else
    echo "NO ubuntu-hw image"
fi
