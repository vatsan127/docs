# _Git_ _Commands_

## _Init_

```
git init 
```

```
git add <files>
```

```
git commit -m "first commit"
```

```
git branch -M master
```

```
git remote add origin https://github.com/vatsan127/producer-events.git
```

```
git push -u origin master
```

---

## _Logs_

```
git log --oneline
```

---

## _cherry-pick_

```
git cherry-pick -m 1 <commit-ID>
```

---

## _Amend_

edit Last Commit message

```
git commit --amend -m "new Commit message"
```

add current changes to previous commit

```
git commit --amend --no-edit
```

---

## _Commit_

revert last commit

```
git revert HEAD
```

move the commit to Unstage

```
git  reset --soft HEAD~<number_Of_commits>
```

reset the changes to HEAD

```
git reset --hard
```

---

## _Alias_

create alias

```
git config --global alias.rm "reset --hard"
```

search existing Alias

```
git config --get-regexp '^alias\.'
```

remove an alias

```
git config --global --unset alias.alias_name
```

Alias created Locally

```
alias.st status
alias.co checkout
alias.get pull origin
alias.set push origin
alias.unstage reset --
alias.rh reset --hard
alias.cp cherry-pick -m 1
alias.cm commit -m
```

---
