# ApiGen

## SurfGen

[SurfGen](https://github.com/surfstudio/SurfGen) is our default choice.

SurfGen используется в проектах, использующих REST API и спецификацию Swagger для описания API.


### Настройка

Файлы для генерации api слоя расположены в директрии tools/api_generator/.

По умолчанию для кодогенерации используется версия SurfGen, собранная для машин на базе Apple Silicon.  
Для того, чтобы запустить кодогенерацию на машине на базе Apple Intel или Linux, нужно в файлах [dto_codegen.sh](tools/api_generator/dto_codegen.sh) и [request_codegen.sh](tools/api_generator/request_codegen.sh) заменить `apple_silicon_generator` на `apple_silicon_generator_intel` или `linux_generator` соответственно.

Если необходимо другой бинарный файл, воспользуйтесь [инструкцией](https://github.com/surfstudio/SurfGen#installation).


### Использование

Чтобы генерация прошла успешно, в файловой системе на одном уровне с папкой проекта должна находится папка со Swagger-репозиторием. В sh скриптах в директории tools/api_generator/ необходимо заменить `flutter-template-swagger` на имя папки со Swagger-репозиторием.

Для генерации нужно запустить скрипт:
```sh  
sh scripts/surfgen.sh
```  
или через [Makefile](Makefile):  
```sh  
make surfgen
```  

Скрипт создаёт изначально DTO модели, далее сами запросы (необходим такой порядок, ибо если создать всё сразу -  
будет ошибка при кодогене).







