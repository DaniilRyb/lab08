FROM ubuntu:18.04
� ᯨ᪥ ��� ����⮢.
# Добавляем все файлы  из текущей директории в создаваемый образ
COPY . print/
# Переходим в созданный каталог
WORKDIR print
# Выполняем сборку нашего проекта
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
# Задаем переменную LOG_PATH
ENV LOG_PATH /home/logs/log.txt
# Указываем в какой директории будут храниться файлы, которые останутся после работы с контейнером
VOLUME /home/logs

WORKDIR _install/bin
# В нащем случае команда ENTRYPOINT опреедляет точку входа в приложение
ENTRYPOINT ./demo
