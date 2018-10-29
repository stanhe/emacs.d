# Concise Emacs
My config for shell script,clojure,python focused on Evil.

## Installation
* emacs version >= 26

### windows
1. git-bash: "c:/Users/$your_name/AppData/Roaming/"

```
rm -rf .emacs.d
```

2. checkout the win branch

```
git clone -b win https://github.com/stanhe/emacs.d.git .emacs.d

```

3. that's all,now enjoy your emacs.
## Features
It's easy to start and use, try this:

Prefix key |Functions|Description
-|-|-
, x|main functions for edit|[,xr]:show recent. [,xf]:open files. [,xj]:dird-jump
F2|fast functions|[f2-n]:neotree. [f2-m]:bottom-eshell. [f2-b]:swap buffer
Space|other features|[spc-n]:show line number. [spc-t]:change-theme. [spc-a]:quickrun.

## Custom
All config files :
* [init.el](./init.el) start and init .
* [stanhe.org](./stanhe.org) main config file.
* [lisp/custom.el](./lisp/custom.el) custom settings.
* [lisp/my-abbrev.el](./lisp/my-abbrev.el) abbrev and skeleton.
* [lisp/**](./lisp/) other customized modes.

