#!/bin/bash

# Создать скрипт expand-variables.sh, который считывает файл с шаблоном переданный через аргумент -f
# или же из стандартного потока ввода и выполняет интерполяцию переданного шаблона с использованием утилиты envsubst.

# Описание аргументов командной строки скрипта:
# ./expand-variables.sh [-f <FILE>] <KEY_VALUE_PAIR> ...

#cat ./template.json | ./expand-variables.sh "SERVER_URL=https://localhost" "DB_CONNECTION_STRING=Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;"
#
#{
#    "ServerUrl": "https://localhost",
#    "DatabaseConnectionString": "Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;"
#}

#./expand-variables.sh -f ./template.json "SERVER_URL=https://localhost" "DB_CONNECTION_STRING=Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;"
#
#{
#    "ServerUrl": "https://localhost",
#    "DatabaseConnectionString": "Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;"
#}

while getopts :f file; do
    case "${file}" in
    f) name=${OPTARG} ;;
    f) name=$((OPTARG)) ;;
    *) echo "unknown argumment" ;;
    esac
done
echo "file name: $name"
#echo "Возраст: $age";
#echo "Пол: $gender";

#SERVER_URL="someURL"

#echo $SERVER_URL
