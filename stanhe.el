
;; base config
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-splash-screen -1)
(setq auto-save-default nil)
(setq make-backup-files nil)

(defun my-config-file ()
  (interactive)
  (find-file "~/.emacs.d/stanhe.org"))

(global-set-key (kbd "<f5>") `my-config-file)

(global-set-key (kbd "C-h") 'delete-backward-char)

;init packages
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(defvar stanhe/packages '(
                     use-package
                     neotree
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

(use-package company
    :init
    (global-company-mode 1)
    :hook(after-init-hook . global-company-mode))

(use-package hungry-delete
    :config
    (global-hungry-delete-mode))

(use-package ivy
    :init
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    :config 
    (ivy-mode 1)
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
    (define-key minibuffer-local-map (kbd "c-r") 'counsel-minibuffer-history))


(use-package evil
    :init
    (general-evil-setup t)
    :config 
    (evil-mode 1)
    (nvmap :prefix ","
        "x1" 'delete-other-windows
        "x0" 'delete-window
        "x2" 'split-window-below
        "x3" 'split-window-right
        "xf" 'counsel-find-file
        "xm" 'counsel-M-x
        "xr" 'counsel-recentf
        "xb" 'ivy-switch-buffer
        "xB" 'list-buffers
        "xd" 'dired
        "xs" 'save-buffer
        "xc" 'save-buffers-kill-terminal
        "xk" 'kill-buffer
        "xe" 'eval-last-sexp
        "ff" 'find-function
        "eb" 'eval-buffer
        "cg" 'counsel-git
        "oa" 'org-agenda
        "ntf" 'neotree-find
        "ntt" 'neotree-toggle
        "nth" 'neotree-hide
        "nts" 'neotree-show
        "ntg" 'neotree-refresh
        "nsv" 'neotree-enter-vertical-split
        "nsh" 'neotree-enter-horizontal-split
    ))

(use-package smartparens
    :init
    (smartparens-global-mode t)
    (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
    :hook(emacs-lisp-mode-hook . show-paren-mode))

(use-package which-key
    :config
    (which-key-mode 1))

(use-package window-numbering
    :config
    (window-numbering-mode 1))

(use-package popwin
    :config
    (popwin-mode 1))

(use-package dired
    :init
    (setq dired-recursive-deletes 'always)
    (setq dired-recursive-copies 'always)
    (setq dired-dwim-target t)
    :config
    (put 'dired-find-alternate-file 'disabled nil)
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
)

(use-package neotree
    :config
    (setq neo-smart-open t)
    :init
    (add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

;;custom settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
