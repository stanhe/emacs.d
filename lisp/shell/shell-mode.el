;; this is my custom eshell-mode
;; main for show eshell at bottom for windows
;; author: stanhe
;; date: 2018-10-27

;; just bind fast-eshell-pop and shell-pop-toggle to your key-bindings
;;
;; shell-pop-toggle:
;;      pop-eshell as side window,much like some IDE.
;; fast-eshell-pop:
;;      open eshell with project mode,open git or gradle project.


(defvar my-shell " *BOTTOM-TERMINAL*" "my open shell name,use eshell.")
(defvar pre-path nil "pre open directory.")

(defun get-current-directory (&optional buffer)
  "get current directory."
  (if (not buffer)
      (file-name-directory (or (buffer-file-name) default-directory))
    (with-current-buffer buffer
      (file-name-directory (or (buffer-file-name) default-directory)))))

(defun get-parent-dir (name)
  "Get the parent name dir."
  (locate-dominating-file default-directory name))

(defun get-project-root-directory (buffer)
  "find current project root,for git or gradle."
  (with-current-buffer buffer
    (or (get-parent-dir "gradlew")
	(get-parent-dir ".git")
	(get-current-directory))))

(defun shell-pop-bottom()
  "pop eshell at bottom"
  (interactive)
  (let ((pos-buffer (current-buffer))
	(tmp-eshell (get-buffer my-shell))
	(dir (get-current-directory)))
    (unless tmp-eshell
      (setq tmp-eshell (eshell "New"))
      (with-current-buffer tmp-eshell
	(rename-buffer my-shell)
	(switch-to-buffer pos-buffer)))
    (setq window
	  (select-window
	   (display-buffer-in-side-window tmp-eshell '((side . bottom))) t))
    (set-window-dedicated-p window t)
    (when (and pre-path (not (equal pre-path dir)))
      (eshell/cd dir)
      (eshell-send-input))
    (setq pre-path dir)))

;;;###autoload
(defun fast-eshell-pop ()
  "fast jump to eshll,it's the same as M-x :eshell "
  (interactive)
  (let* ((buffer (current-buffer))
	 (shell (eshell))
	 (dir (get-project-root-directory buffer)))
    (message "current dir : %s" dir)
    (if (equal "*eshell*" (buffer-name buffer))
	(switch-to-buffer nil)
      (progn
	(switch-to-buffer shell)
	(when (and pre-path (not (equal pre-path dir)))
	  (eshell/cd dir)
	  (eshell-send-input))))
    (setq pre-path dir)
    (bury-buffer shell)))

;;;###autoload
(defun shell-pop-toggle ()
  "pop eshell or hide."
  (interactive)
  (if (get-buffer-window my-shell)
      (delete-windows-on my-shell)
    (shell-pop-bottom)))

;;;###autoload
(define-minor-mode pop-shell-mode "my pop-shell mode")

(provide 'pop-shell-mode)
;;; my gradle-mode end.
