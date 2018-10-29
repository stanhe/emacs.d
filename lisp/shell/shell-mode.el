;; this is my custom eshell-mode
;; main for show eshell at bottom for windows
;; author: stanhe
;; date: 2018-10-27

;; pop-shell-shell

(defvar my-shell " *BOTTOM-TERMINAL*" "my open shell name,use eshell.")

(defun shell-pop-bottom()
"pop eshell at bottom"
(interactive)
(let ((pos-buffer (current-buffer))(tmp-eshell (get-buffer my-shell)) (dir (file-name-directory (or (buffer-file-name) default-directory))))
    (unless tmp-eshell
      (setq tmp-eshell (eshell "New"))
      (with-current-buffer tmp-eshell
	(rename-buffer my-shell)
	(switch-to-buffer pos-buffer)))
    (select-window (display-buffer-in-side-window tmp-eshell '((side . bottom))))
    (cd dir)))

;;;###autoload
(defun shell-pop-toggle ()
  "pop eshell or hide."
  (interactive)
  (if (get-buffer-window my-shell)
      (delete-windows-on my-shell)
    (shell-pop-bottom))
  (bury-buffer my-shell))

;;;###autoload
(define-minor-mode pop-shell-mode "my pop-shell mode")

(provide 'pop-shell-mode)
;;; my gradle-mode end.
