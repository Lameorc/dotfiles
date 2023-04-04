#!/usr/bin/fish

# alias for dotfiles git tracking
function dotfilesctl -w "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function de -w "docker exec"
  docker exec $argv
end

abbr dc docker-compose

function dcup -w "docker-compose up"
  docker-compose up $argv
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

function codedirs
    set base_dir $HOME/Code
    set dest (fd --base-directory $base_dir -t directory . | fzf --height=40% --reverse --border --info=inline)
    if test -z $dest
        return
    end
    cd $base_dir/$dest
end
