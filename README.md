# Desktop



## add撤销更改

### 撤回更改

git reset --mixed

### 撤销代码

git checkout .



### 撤回更改并撤销代码

git reset --hard







## commit 撤销更改

### 撤销commit 

git reset --soft 81bcecd5f8a58997772ee3441230a6baa1bede23

### 撤销add

git reset --mixed



### add commit 撤销更改

git reset --mixed 81bcecd5f8a58997772ee3441230a6baa1bede23







## push本地与远程同时撤销更改

git reset --hard 81bcecd5f8a58997772ee3441230a6baa1bede23

git push -f



git revert head

:wq

git push