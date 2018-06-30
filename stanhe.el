;; base config
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq ring-bell-function 'ignore)
(setq inhibit-splash-screen -1)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default abbrev-mode t)
(setq shell-command-switch "-ic")
(setq initial-scratch-message (concat ";;Happy hacking, " user-login-name "\n\n"))

(defun my-config-file ()
  (interactive)
  (find-file "~/.emacs.d/stanhe.org"))

(global-set-key (kbd "<f5>") `my-config-file)

;init packages
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(defvar stanhe/packages '(
                     ;; ========basic=======
                     use-package
                     neotree
                     ace-window
		     company
		     hungry-delete
		     counsel
		     evil
		     hydra
		     general
		     smartparens
		     which-key
		     window-numbering
		     popwin
		     monokai-theme
		     projectile
		     counsel-projectile
		     magit
		     keychain-environment
                     multi-term
		     ;; ========feature========
		     js2-mode
                     gh-md
                     markdown-mode

		     ) "My default packages")

(require 'cl)

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
(require 'use-package)

(use-package evil
    :init
    (general-evil-setup t)
    :config 
    (evil-mode 1)
    (nvmap :prefix "SPC"
	"f" 'my-config-file)
    (nvmap :prefix ","
	"p" 'projectile-command-map
	"v" 'evil-visual-block

	"x1" 'delete-other-windows
	"xo" 'other-window
	"x0" 'delete-window
	"xq" 'delete-window
	"x2" 'split-window-below
	"x3" 'split-window-right
	"xf" 'counsel-find-file
	"xm" 'counsel-M-x
	"xr" 'counsel-recentf
	"xb" 'ivy-switch-buffer
	"bb" 'back-to-previous-buffer
	"xB" 'list-buffers
	"xd" 'dired
	"xj" 'dired-jump
	"xs" 'save-buffer
	"xc" 'save-buffers-kill-terminal
	"xk" 'kill-buffer
	"xe" 'eval-last-sexp

	"aw" 'ace-swap-window
	"eb" 'eval-buffer
	"cg" 'counsel-git
	"oa" 'org-agenda

	"nf" 'neotree-find
	"nt" 'neotree-toggle
	"gs" 'magit-status

	"mm" 'multi-term
	"mt" 'multi-term-dedicated-toggle
    )
)

(use-package hydra
  :config
  (defhydra hydra-zoom (global-map "<f2>")
  "functions"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out")
  ("r" (text-scale-set 0) "reset" :color blue)
  ("n" neotree-toggle "neotree" :color blue)
  ("m" multi-term-dedicated-toggle "multi-term" :color blue)
  ("k" kill-buffer "kill-buffer" :color blue)
  ("b" ivy-switch-buffer "switch-buffer" :color blue)
  ))

(use-package neotree
    :config
    (setq neo-smart-open t)
    (nvmap :status '(normal emacs)
      :keymaps 'neotree-mode-map
      "s" 'neotree-hidden-file-toggle
      "g" 'neotree-refresh
      "d" 'neotree-delete-node
      "r" 'neotree-rename-node
      "R" 'neotree-change-root
      "c" 'neotree-create-node
      "v" 'neotree-enter-vertical-split
      "h" 'neotree-enter-horizontal-split
      "a" 'neotree-enter-ace-window
      "SPC" 'neotree-quick-look
      "TAB" 'neotree-enter
      "RET" 'neotree-enter
      "q" 'neotree-hide
      ))

(use-package counsel
    :init
    (setq ivy-use-virtual-buffers t
	  ivy-count-format "(%d/%d) "
	  ivy-height 20
	  enable-recursive-minibuffers t)
    :config 
    (ivy-mode 1)
    (ivy-set-actions
	'counsel-find-file
	'(("m" delete-file "delete")))
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package multi-term
  :init
  (setq multi-term-dedicated-select-after-open-p t
	multi-term-program "/bin/zsh")
  :config
  (nvmap :states '(insert normal)
    "C-n" 'multi-term-next
    "C-p" 'multi-term-prev
    ))

(use-package company
    :init
    (global-company-mode 1)
    (setq company-idle-delay 0.1
	  company-minimum-prefix-length 1)
    :hook(after-init-hook . global-company-mode))

(use-package hungry-delete
    :config
    (global-hungry-delete-mode))

(use-package org
    :init
    (setq org-src-fontify-natively t
	  org-log-done 'time
	  org-agenda-files '("~/org/")
	  org-confirm-babel-evaluate nil))

(use-package smartparens-config
    :config
    (show-paren-mode)
    (smartparens-global-mode)
    (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil))

(use-package which-key
    :config
    (which-key-mode 1))

(use-package window-numbering
    :config
    (window-numbering-mode 1))

(use-package popwin
    :config
    (popwin-mode 1))

(use-package dired-x)
(use-package dired
    :init
    (setq dired-recursive-deletes 'always
	  dired-recursive-copies 'always
	  dired-dwim-target t)
    :config
    (put 'dired-find-alternate-file 'disabled nil)
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
)

(use-package ace-window)

(use-package projectile
    :init
    (setq projectile-completion-system 'ivy)
    :config
    (projectile-mode)
    (counsel-projectile-mode))

(use-package magit
    :init
    (keychain-refresh-environment)
    (setq magit-completing-read-function 'ivy-completing-read))

;; ====================================== feature ====================================

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package gh-md)

(use-package js2-mode
  :init
  (setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist)))

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "<C-return>") (lambda()
				     (interactive)
				     (progn(end-of-line)
					   (if(string-match ";\[\[:space:\]\]*$" (thing-at-point 'line t))
					       (newline-and-indent)
					     (progn
					       (insert ";")
					       (newline-and-indent)))
					   )))

;; back buffer
(defun back-to-previous-buffer ()
       (interactive)
       (switch-to-buffer nil))
;; show paren in function
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
"Highlight enclosing parens."
(cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	    (ignore-errors (backward-up-list))
	    (funcall fn)))))
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
(define-abbrev org-mode-abbrev-table "isrc" "" '1src)
(define-abbrev org-mode-abbrev-table "ijava" "" '1java)
;; hippie expand
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
