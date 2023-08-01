## 1

Вывести список всех удаленных репозиториев для локального

```
git remote -v
origin  https://github.com/tms-dos17-onl/alexandr-nikiforov.git (fetch)
origin  https://github.com/tms-dos17-onl/alexandr-nikiforov.git (push)
```


## 2

Вывести список всех веток

```
git branch
  develop
* main
```


## 3

Вывести последние 3 коммитa с помощью git log

```
git log -3
commit b03dd370303b1c13c38cdc184c680c950407ac60 (HEAD -> main, origin/main, origin/HEAD)
Author: Alexandr <belmymail@gmail.com>
Date:   Tue Aug 1 11:22:15 2023 +0300

    move output.md to the root directory

commit 32942d16bb6ecf9dc99f577dac6229945664a756
Author: Alexandr <belmymail@gmail.com>
Date:   Tue Aug 1 11:20:41 2023 +0300

    Create output.md

commit 3c9e137a51c6e8f37142ba47a07e742cf1516ae1
Author: Alexandr <belmymail@gmail.com>
Date:   Tue Aug 1 11:17:58 2023 +0300

    deleted temp files
```


## 4

Создать пустой файл README.md и сделать коммит

```
 git add README.md

git commit -m "HW_7 added README.MD"
[main 127e062] HW_7 added README.MD
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 HW_7/README.md
```


## 5

Добавить фразу "Hello, DevOps" в README.md файл и сделать коммит

```