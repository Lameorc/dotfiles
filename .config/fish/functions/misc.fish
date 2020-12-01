#!/usr/bin/fish

# alias for dotfiles git tracking
function config -w "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function de
  docker exec $argv
end

abbr dc docker-compose

function dcup -w "docker-compose up"
  docker-compose up $argv
end

function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end

function docker-clean
    docker stop (docker ps -q)
    docker rm -f (docker ps -aq)
    docker rmi -f (docker images -q)
end

# this is pretty dirty
function dive
    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest $argv
end
