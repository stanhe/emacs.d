;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev --copied from Xah
;; Note:
;;      prevent abbrev expansion ma-me <C-q> SPC
(clear-abbrev-table global-abbrev-table)

;; skeleton	    

(define-skeleton 1src
    "Input src"
    ""
    "#+BEGIN_SRC emacs-lisp \n"
    _ "\n"
    "#+END_SRC")
(define-skeleton 1java
    "Input src"
    ""
    "#+HEADER: :classname\n"
    "#+BEGIN_SRC java \n"
    _ "\n"
    "#+END_SRC")

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
