Title: Репозиторий sf_wordpress_experimental
Date: Fri 30 Jul 2021 03:19:59 PM UTC
Modified: Fri 30 Jul 2021 03:19:59 PM UTC
Category: Wordpress
Tags: wordpress, docker
Slug: wp-experimental
Authors: Evgeniy Malyshev
Summary: Использование репозитория sf_wordpress_experimental

# Репозиторий для разработки сайта на Wordpress

## Требования для запуска

Для запуска потребуются git, make и docker-compose.

## Состав

Состав проекта описан в docker-compose.yml, это контейнеры с СУБД MySQL, контейнер с Wordpress, отдельный контейнер с Wordpress CLI для управления и контейнер с Webdav-клиентом для Яндекс-диска для хранения бэкапов проекта.
Все переменные хранятся в файле .env

В состав входит контейнер webdav-client, который монтирует Яндекс-диск для создания бэкапов. Для запуска контейнера нужно указать пароль для приложения Яндекс-Диск в файле .env или в командной строке при ручном запуске:

~~~
WEBDRIVE_PASSWORD=<пароль для приложения яндексдиска> docker-compose up -d
~~~

Узнать, как создать пароль для приложения можно по этой ссылке: https://yandex.ru/support/id/authorization/app-passwords.html

## Сценарии использования

make start: запуск контейнеров

make stop: остановка контейнеров

make export: экспорт базы в файл latest-backup.sql

make backup: экспорт базы и копирование архива на яндекс-диск, процедура копирования в скрипте webdav-backup.sh
