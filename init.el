; init file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-enable-at-startup nil)
(package-initialize)
(setq byte-compile-warnings '(cl-functions))
(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))
    ;; ===> 配置 开始

  ;;init with org-file.
  (org-babel-load-file (expand-file-name "stanhe.org" user-emacs-directory))

  ;;add all my custom modes.
  (init-my-load-path)
  (choose-theme-by-time)
  (use-package ace-jump-mode)
  (use-package key-chord
    :defer 3
    :config
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))
  (use-package gradle-mode
    :defer 3)
  (use-package pop-eshell-mode
    :defer 3
    :init
    (setq pop-find-parent-directory '(".git" "gradlew"))
    :config
    (pop-eshell-mode))

  ;;(run-with-idle-timer 1 nil (lambda () (_loading 1 "loading...." (load-theme 'sanityinc-tomorrow-day))))

  (run-with-idle-timer 1 nil (lambda () (_loading 1 "loading...." (find-file "~/.org/2022.org"))))
    ;; ===> 配置 结束 
)
