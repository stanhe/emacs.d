# Concise Emacs
My config for shell script,clojure,python focused on Evil.

## Installation
* emacs version >= 24
### linux
main features support.
```
git clone https://github.com/stanhe/emacs.d.git ~/.emacs.d
```
### windows

partion features support,checkout the win branch.

## Features
It's easy to start and use, try this:

Prefix key |Functions|Describe
-|-|-
, x|main functions for edit|eg: (,xr):show recent .(,xf):open files.(,xj):dird-jump
F2|fast functions|eg: (f2-n):neotree.(f2-m):multi-term.(f2-b):swap buffer
Space|other features|eg: (spc-n):show line number.(spc-t):change-theme.(spc-a):quickrun.

## Custom
All config files :
* [init.el](./init.el) start and init .
* [stanhe.org](./stanhe.org) main config file.
* [lisp/custom.el](./lisp/custom.el) custom settings.
* [lisp/my-abbrev.el](./lisp/my-abbrev.el) abbrev and skeleton.
* [lisp/**](./lisp/) other customized modes.

