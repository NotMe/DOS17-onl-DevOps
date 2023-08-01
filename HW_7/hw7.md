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
git commit -m "modified: HW_7/README.md"
```


## 6

Сделать реверт последнего коммита. Вывести последние 3 коммитa с помощью git log

```
git revert 20c88b8189fc4471f6b3723971a7cf972b5d3583
[main b89175d] Revert "HW_7"
 1 file changed, 67 deletions(-)
 delete mode 100644 HW_7/hw7.md


git log -3
commit b89175d9f2f4e0772a4278971250576f0c48fc17 (HEAD -> main)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 15:46:22 2023 +0300

    Revert "HW_7"

    This reverts commit 20c88b8189fc4471f6b3723971a7cf972b5d3583.

commit 20c88b8189fc4471f6b3723971a7cf972b5d3583 (origin/main, origin/HEAD)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 15:39:31 2023 +0300

    HW_7

commit b92d4525cf22dbc76c270f623145755fe69862bd
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 15:38:22 2023 +0300

    modified:   HW_7/README.md 
```


## 7

Удалить последние 3 коммита с помощью git reset

```
git reset --hard HEAD~3
```


## 8

Вернуть коммит, где добавляется пустой файл README.md. Для этого найти ID коммита в git reflog, а затем сделать cherry-pick

```
git reflog
b03dd37 (HEAD -> main) HEAD@{0}: reset: moving to HEAD~3~
b89175d HEAD@{1}: revert: Revert "HW_7"
20c88b8 (origin/main, origin/HEAD) HEAD@{2}: commit: HW_7
b92d452 HEAD@{3}: commit: modified: HW_7/README.md
127e062 HEAD@{4}: commit: HW_7 added README.MD


git cherry-pick 127e062
[main f538648] HW_7 added README.MD
 Date: Tue Aug 1 15:32:11 2023 +0300
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 HW_7/README.md
```


## 9

Удалить последний коммит с помощью git reset

```
git reset --hard HEAD~
HEAD is now at b03dd37 move output.md to the root directory
```


## 10

Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main

```
git checkout main   
Switched to branch 'main'
```


## 11

Скопировать файл https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml, положить его по такому же относительному пути в репозиторий. 
Создать коммит и запушить его в удаленный репозиторий.

```

```