# Pelican через Docker

## Функционал

Этот репозиторий позволяет с помощью Docker запустить локально сервис Pelican. Этот сервис позволяет опубликовать локальный каталог с Markdown-файлами в виде веб-сайта с возможностями навигации, поиска по тэгам, тематикам и авторам. [Подробнее о Pelican](https://docs.getpelican.com/)

## Требования

Для использования потребуются Git, Docker и Make.

## Основные сценарии использования

### Создание нового сайта 

Сначала потребуетс создать новый сайт. Для этого нужно запустить

```
make new
```
или
```
docker run -it --rm -v $(pwd):/srv/pelican mjjacko/pelican pelican-quickstart -p my-site
```

Это создаст в текущей директории `$(pwd)` новую поддиректорию и наполнит её согласно ответам на вопросы скрипта. 

### Запуск сервиса

Сервис можно запустить двумя способами, интерактивно и в качестве демона:

1. Интерактивно - вывод будет поступать в консоль

  ```
  make site=my-site start-interactive
  ```
  
  В качестве переменной site нужно указать тот сайт, который вы уже создали и который требуется опубликовать.
  
  Также можно сделать то же самое без Make:

  ```
  cd my-site 
  docker run --rm -v $(pwd):/srv/pelican --name pelican-dev -p 8000:8000  mjjacko/pelican
  ```

2. Запустить в качестве демона, вывод будет поступать в лог Docker:

  ```
  make site=my-site start-daemon
  ```
  
  В качестве переменной site нужно указать тот сайт, который вы уже создали и который требуется опубликовать.
  
  Также можно сделать то же самое без Make:
  
  ```
  cd my-site
  docker run --rm -v $(pwd):/srv/pelican -d --name pelican-dev -p 8000:8000  mjjacko/pelican
  ```

Запуск может занять несколько минут. Сервер будет отвечать на порту 8000.

### Просмотр логовЖ

Логи можно смотреть или интерактивно, или при запуске в качестве демона командой

```
make logs
```
или
```
docker logs -f pelican-dev
```
## Остановка контейнера

Контейнер можно остановить командой

```
make stop
```
или
```
docker stop pelican-dev
```

## Docker Hub repo

The DockerHub repository can be found here: https://hub.docker.com/r/mjjacko/pelican/

![Using the image](http://i.giphy.com/l396GL1mien20Tap2.gif)

## License

[BSD 2-Clause license](http://opensource.org/licenses/bsd-license.php)
