#!/bin/bash

retry() {
    local -i max_attempts="5"
    local -i cmd="curl "${curl_opts[@]}" http://localhost:8080/heath | grep -q 'UP'"
    local -i attempt_num=1
    
    until $cmd
    do
        if (( attempt_num == max_attempts ))
        then
            echo "Ereur lors du démarrage de l'application"
            return 1
        else
            echo "Java is starting, please wait...! Trying again in $attempt_num seconds..."
            sleep $(( attempt_num++ ))
        fi
    done
}
