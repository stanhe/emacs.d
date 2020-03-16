; init file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-enable-at-startup nil)
(package-initialize)

;;init with org-file.
(org-babel-load-file (expand-file-name "stanhe.org" user-emacs-directory))

;;add all my custom modes.
(init-my-load-path)
(choose-theme-by-time)
;; 应用路径
;;(setq custom-open-win-apps-dir "d:/Eapps")
(defconst custom-open-win-apps-dir (concat "c:/Users/" user-login-name "/Eapps") "refer to the custom directory of all apps")
;; 本机git-bash路径
;;(setq custom-git-bash-path "c:/Program Files/Git/git-bash.exe")
(defconst custom-git-bash-path "c:/Program Files/Git/" "refer to custom git bash path")

(use-package my-test)
(use-package gradle-mode)
(use-package pop-eshell-mode
  :init
  (setq pop-find-parent-directory '(".git" "gradlew" ".projectile")))
