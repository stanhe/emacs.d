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
(my-autoload "gradle")
(my-autoload "pop-eshell")


;;my config for modules and methods
(choose-theme-by-time)
(setq pop-find-parent-directory '(".git" "gradlew"))
(setq my-run-application-plist '(git-bash "c:/Program Files/Git/git-bash.exe"
				chrome "c:/Program Files (x86)/Google/Chrome/Application/chrome.exe"))
