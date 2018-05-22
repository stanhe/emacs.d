;; key bindings 
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
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(nvmap :prefix ","
       "x1" 'delete-other-windows
       "x0" 'delete-window
       "x2" 'split-window-below
       "x3" 'split-window-right
       "xf" 'counsel-find-file
       "xm" 'counsel-M-x
       "xr" 'counsel-recentf
       "xb" 'ivy-switch-buffer
       "xd" 'dired
       "xs" 'save-buffer
       "xc" 'save-buffers-kill-terminal
       "xk" 'kill-buffer
       "xe" 'eval-last-sexp
       "ff" 'find-function
       "eb" 'eval-buffer
       "cg" 'counsel-git
  )


(global-set-key (kbd "C-h") 'delete-backward-char)


(provide 'init-kbd)
