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
git commit -m "HW_7 new file validate-shell.yaml"
[main f44a954] HW_7 new file validate-shell.yaml
 1 file changed, 1341 insertions(+)
 create mode 100644 .github/workflows/validate-shell.yaml

 git push origin main
 ```


## 12

Создать из ветки main ветку develop. Переключиться на неё и создать README.md в корне репозитория. 
Написать в этом файле какие инструменты DevOps вам знакомы и с какими вы бы хотели познакомиться больше всего (2-3 пункта).

```
git add README.MD
warning: in the working copy of 'README.MD', LF will be replaced by CRLF the next time Git touches it

git commit -m "HW_7 added README.md"
[develop 5094239] HW_7 added README.md
 1 file changed, 3 insertions(+)
 create mode 100644 README.MD

git push origin develop
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 417 bytes | 417.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/tms-dos17-onl/alexandr-nikiforov.git
   8a8cf8f..5094239  develop -> develop
```


## 13

Создать из ветки main ветку support и создать там файл LICENSE с содержимым https://www.apache.org/licenses/LICENSE-2.0.txt. Создать коммит. Вывести последние 3 коммитa.

```
git branch support

git checkout support

curl -O https://www.apache.org/licenses/LICENSE-2.0.txt

git add LICENSE-2.0.txt
warning: in the working copy of 'LICENSE-2.0.txt', LF will be replaced by CRLF the next time Git touches it


git commit -m "added LICENSE-2.0.txt"
[support 4fdc033] added LICENSE-2.0.txt
 1 file changed, 202 insertions(+)
 create mode 100644 LICENSE-2.0.txt


git log -3
commit 4fdc033488a6abbad5e1d968ad432c40b3ec8567 (HEAD -> support)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 17:08:35 2023 +0300

    added LICENSE-2.0.txt

commit ce8cc1de6687225cd8ae53b0d0a6883e0d3404fb (origin/main, origin/HEAD, main)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 16:25:01 2023 +0300

    HW_7 11

commit 1a5e8c2ee262ceb44df19d5f963f9480c652e9c7
Merge: 137daad 20c88b8
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 16:24:11 2023 +0300

    Merge branch 'main' of https://github.com/tms-dos17-onl/alexandr-nikiforov
```


## 14

Переключиться обратно на ветку main и создать там файл LICENSE с содержимым https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt
Создать коммит. Вывести последние 3 коммитa.

```
curl -O https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt > LICENSE

git add LICENSE

git commit -m "added LICENSE"
[main b84a943] added LICENSE
 1 file changed, 20 insertions(+)
 create mode 100644 LICENSE


git log -n 3
commit b84a9433ada5d81418199d86373763789be327ed (HEAD -> main)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 17:16:47 2023 +0300

    added LICENSE

commit ce8cc1de6687225cd8ae53b0d0a6883e0d3404fb (origin/main, origin/HEAD)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 16:25:01 2023 +0300

    HW_7 11

commit 1a5e8c2ee262ceb44df19d5f963f9480c652e9c7
Merge: 137daad 20c88b8
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 16:24:11 2023 +0300

    Merge branch 'main' of https://github.com/tms-dos17-onl/alexandr-nikiforov
```


## 15

Сделать merge ветки support в ветку main и решить конфликты путем выбора содержимого только одной лицензии

```
git checkout main
git merge support

Auto-merging LICENSE
CONFLICT (add/add): Merge conflict in LICENSE
Automatic merge failed; fix conflicts and then commit the result.

git mergetool
	
This message is displayed because 'merge.tool' is not configured.
See 'git mergetool --tool-help' or 'git help config' for more details.
'git mergetool' will now attempt to use one of the following tools:
tortoisemerge emerge vimdiff nvimdiff
Merging:
LICENSE

Normal merge conflict for 'LICENSE':
{local}: created file
{remote}: created file
Hit return to start merge resolution tool (vimdiff):
3 files to edit
fatal: You have not concluded your merge (MERGE_HEAD exists).
Please, commit your changes before you merge.

git commit
[main 71ecb98] Merge branch 'support'
```


## 16

Переключиться на ветку develop и сделать rebase относительно ветки main.

```
git checkout develop
Switched to branch 'develop'
Your branch is up to date with 'origin/develop'.

git rebase main
Successfully rebased and updated refs/heads/develop
```


## 17

Вывести историю последних 10 коммитов в виде графа с помощью команды git log -10 --oneline --graph.

```
git log -10 --oneline --graph
* 1723fb1 (HEAD -> develop) HW_7 added README.md
* c1d759c create create-issues.sh
*   71ecb98 (main) Merge branch 'support'
|\
| * 7ac80da (origin/support, support) added LICENSE and remove LICENSE-2.0.txt
| * 4fdc033 added LICENSE-2.0.txt
* | b84a943 added LICENSE
|/
* ce8cc1d (origin/main, origin/HEAD) HW_7 11
*   1a5e8c2 Merge branch 'main' of https://github.com/tms-dos17-onl/alexandr-nikiforov
|\
| * 20c88b8 HW_7
| * b92d452 modified:   HW_7/README.md

```


## 18

Запушить ветку develop. В истории коммитов должен быть мерж support -> main.

```
git checkout develop

git push origin develop

git log -n 2
commit e5479c865ac72cbc97b0a5b290362d8e9873ded3 (HEAD -> develop, origin/develop)
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 17:47:08 2023 +0300

    deleted:    LICENSE-2.0.txt

commit 339940c09a8d3d24fced4c8dd5da1b166d216d64
Merge: 3c34e38 5094239
Author: NotMe <belmymail@gmail.com>
Date:   Tue Aug 1 17:46:51 2023 +0300

    Merge branches 'develop' and 'develop' of https://github.com/tms-dos17-onl/alexandr-nikiforov into develop
```