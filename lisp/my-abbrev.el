;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev --copied from Xah
;; Note:
;;      prevent abbrev expansion ma-me <C-q> SPC

;; hippie expand
(setq hippie-expand-try-function-lisk '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
;; skeleton	    
(define-skeleton 1src
    "Input src"
    ""
    >"#+BEGIN_SRC emacs-lisp \n"
    >"    "_ ?\n
    >"#+END_SRC")

(define-skeleton 1java
    "Input src"
    ""
    >"#+HEADER: :classname T1"?\n
    >"#+BEGIN_SRC java"?\n
    >"  class T1{" ?\n
    > -2"    public static void main(String[] args){"?\n
    > -4"      System.out.println(\"test1\");"_ ?\n
    > -6"  }}"?\n
    > -2"#+END_SRC"?\n)

(define-skeleton sth-defun
  "define my function by skeleton"
  >"(defun " (skeleton-read "Function name:")"("(skeleton-read "Params: ")")" \n
  >"\"" (skeleton-read "Docstring: ") "\"" \n
  >(if (y-or-n-p "interactive?:") "\(interactive\)\n" "")
  >"(" _  "))" \n
)

(clear-abbrev-table global-abbrev-table)
;; (define-abbrev org-mode-abbrev-table "isrc" "" '1src)
;; (define-abbrev org-mode-abbrev-table "ijava" "" '1java)
(define-abbrev-table 'global-abbrev-table
  '(

    ;; my abbrev
    ("me" "stanhe" )
    ("isrc" "" 1src)
    ("ijava" "" 1java)

    ))

;; define abbrev for specific major mode
;; the first part of the name should be the value of the variable major-mode of that mode
;; e.g. for python-mode, name should be python-mode-abbrev-table

(when (boundp 'python-mode-abbrev-table)
  (clear-abbrev-table python-mode-abbrev-table))
(define-abbrev-table 'python-mode-abbrev-table
  '(

    ("h" "#!/usr/bin/env python")

    ))

(when (boundp 'sh-mode-abbrev-table)
  (clear-abbrev-table sh-mode-abbrev-table))
(define-abbrev-table 'sh-mode-abbrev-table
  '(

    ("h" "#!/bin/bash")

    ))
(set-default 'abbrev-mode t)

(setq save-abbrevs nil)

(provide 'my-abbrev)
