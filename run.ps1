# Перед запуском
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# Запуск
# ./run.ps1
# 
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass && ./run.ps1

$Env:VAGRANT_PREFER_SYSTEM_BIN = 0

vagrant up

vagrant upload .env /home/vagrant/.env

vagrant ssh -- -t @'
    # Загружаем переменные из .env
    set -a
    source <(cat /home/vagrant/.env | tr -d '\r')
    set +a   

    GIT_PROJECT_NAME="$(basename "$GIT_FULL_URL" .git)"
    
    # Переходим в проекты
    mkdir /home/vagrant/projects
    cd /home/vagrant/projects

    # Ставим дополнительное ПО
    sudo apt update && 
    sudo apt install -y git lxc lxc-templates

    # Проверяем, есть ли уже проект
    if [ -d "${GIT_PROJECT_NAME}" ]; then
        cd "${GIT_PROJECT_NAME}"
        git pull
    else
        git clone "${GIT_FULL_URL}"
        cd "${GIT_PROJECT_NAME}"
    fi

    echo Welcome to ${GIT_PROJECT_NAME};
    /bin/bash
'@
