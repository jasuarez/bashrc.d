alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lh --color=auto'

alias discover-hub-hosts='nmap -sP 10.42.0.0/24'
alias discover-lan-hosts='nmap -sP 192.168.50.0/24'

alias chrome-docker='docker run -it --rm --net host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $HOME/Downloads/Chrome:/root/Downloads -v $HOME/.config/google-chrome:/data --device /dev/snd --name chrome jess/chrome'
