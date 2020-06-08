## Laboratory work VIII


<a href="https://yandex.ru/efir/?stream_id=v0mnBi_R2Ldw"><img src="https://raw.githubusercontent.com/tp-labs/lab08/master/preview.png" width="640"/></a>

Данная лабораторная работа посвещена изучению систем автоматизации развёртывания и управления приложениями на примере **Docker**

```sh
$ open https://docs.docker.com/get-started/
```

## Tasks

- [x] 1. Создать публичный репозиторий с названием **lab08** на сервисе **GitHub**
- [x] 2. Ознакомиться со ссылками учебного материала
- [x] 3. Выполнить инструкцию учебного материала
- [x] 4. Составить отчет и отправить ссылку личным сообщением в **Slack**

## Tutorial


```sh
$ export GITHUB_USERNAME=DaniilRyb

```

```sh

$ cd ${GITHUB_USERNAME}/workspace
$ pushd .
~/Daniil_Rip/Daniil_Rip/lab08 ~/Daniil_Rip/Daniil_Rip/lab08
$ source scripts/activate
```

```sh
$ git clone https://github.com/${GITHUB_USERNAME}/lab07 lab08
$ cd lab08

$ git submodule update --init
Submodule 'tools/polly' (https://github.com/ruslo/polly) registered for path 'tools/polly'
Cloning into 'C:/Users/Daniil-PC/Daniil_Rip/Daniil_Rip/lab08/tools/polly'...
Submodule path 'tools/polly': checked out '0b3806e193b668fbb9b70c9aa70735b29396323d'
$ git remote remove origin
$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab08
```

```sh
$ cat > Dockerfile <<EOF
FROM ubuntu:18.04
EOF
```

```sh
$ cat >> Dockerfile <<EOF

RUN apt update
# Флаг yy говорит соглашаться со всеми вопросами. которые возникают в ходе установки
RUN apt install -yy gcc g++ cmake
EOF
```


```sh

$ cat >> Dockerfile <<EOF
# Добавляем все файлы  из текущей директории в создаваемый образ
COPY . print/
# Переходим в созданный каталог
WORKDIR print
EOF
```
.
```sh
$ cat >> Dockerfile <<EOF
# Выполняем сборку нашего проекта
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
EOF
```

```sh
$ cat >> Dockerfile <<EOF
# Задаем переменную LOG_PATH
ENV LOG_PATH /home/logs/log.txt
EOF
```

```sh
$ cat >> Dockerfile <<EOF
# Указываем в какой директории будут храниться файлы, которые останутся после работы с контейнером
VOLUME /home/logs
EOF
```

```sh
$ cat >> Dockerfile <<EOF

WORKDIR _install/bin
EOF
```

```sh
$ cat >> Dockerfile <<EOF
# В нащем случае команда ENTRYPOINT опреедляет точку входа в приложение
ENTRYPOINT ./demo
EOF
```

$ docker build -t logger .


```sh
$ docker images

```

```sh
$ mkdir logs
$ docker run -it -v "$(pwd)/logs/:/home/logs/" logger /bin/bash

text1
text2
text3
<C-D>
```

```sh
$ docker inspect logger
```

```sh
$ cat logs/log.txt
text1
text2
text3
```

```sh
$ gsed -i 's/lab07/lab08/g' README.md
```

```sh
$ vim .travis.yml
/lang<CR>o
services:
- docker<ESC>
jVGdo
script:
- docker build -t logger .<ESC>
:wq
```

```sh

$ git add Dockerfile
$ git add .travis.yml
$ git push origin master
```

```sh

$ travis login --auto --com
$ travis enable --com
```

## Report

```sh

$ popd
$ export LAB_NUMBER=08
$ git clone https://github.com/tp-labs/lab${LAB_NUMBER} tasks/lab${LAB_NUMBER}
$ mkdir reports/lab${LAB_NUMBER}
$ cp tasks/lab${LAB_NUMBER}/README.md reports/lab${LAB_NUMBER}/REPORT.md
$ cd reports/lab${LAB_NUMBER}
$ edit REPORT.md
$ gist REPORT.md
```

## Links

- [Book](https://www.dockerbook.com)
- [Instructions](https://docs.docker.com/engine/reference/builder/)

```
Copyright (c) 2015-2019 The ISC Authors
```
