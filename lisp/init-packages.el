;init packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
(require 'cl)
(defvar stanhe/packages '(
		     company
		     hungry-delete
		     swiper
		     counsel
		     evil
		     general
		     smartparens
		     which-key
		     window-numbering
		     popwin
		     monokai-theme
		     ) "Default packages")

(setq package-selected-packages stanhe/packages)

(defun stanhe/packages-install-p ()
  (loop for pkg in stanhe/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (stanhe/packages-install-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg stanhe/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(load-theme 'monokai 1)       

(global-hungry-delete-mode)

(smartparens-global-mode t)

(global-company-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'after-init-hook 'global-company-mode)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(evil-mode 1)
(general-evil-setup t)


(which-key-mode 1)

(window-numbering-mode 1)


(require 'popwin)
(popwin-mode 1)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("6me" "stanhe")
					    ))
(provide 'init-packages)
