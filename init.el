; init file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-enable-at-startup nil)
(package-initialize)

;; custom file
(load (expand-file-name "lisp/custom.el" user-emacs-directory))
(load (expand-file-name "lisp/my-abbrev.el" user-emacs-directory))

;;init with org-file
(org-babel-load-file (expand-file-name "stanhe.org" user-emacs-directory))



