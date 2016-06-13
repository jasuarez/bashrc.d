alias docker-chrome='docker run --privileged -it --rm --net host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $HOME/Downloads/Chrome:/root/Downloads --device /dev/snd --name chrome jess/chrome'

alias docker-spotify='docker run --privileged  --name=spotify_client --rm=true --net=host --device /dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY --volume $HOME/.spotify:/root --volume /dev/shm:/dev/shm --volume /tmp:/tmp --volume /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket -v /run/user/$UID/pulse/native:/root/pulseaudio/socket --env PULSE_SERVER=unix:/root/pulseaudio/socket yammelvin/spotify-client'

