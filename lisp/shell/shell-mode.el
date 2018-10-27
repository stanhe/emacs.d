;; this is my custom eshell-mode
;; main for show eshell at bottom for windows
;; author: stanhe
;; date: 2018-10-27

;; pop-shell-shell

(defvar my-shell "*eshell*" "my open shell name,use eshell.")

(defun get-mini-size()
  "the smallest size."
  (let ((size (floor (* 0.3 (window-total-height)))))
	(- size)))

(defun shell-pop-bottom()
"pop eshell at bottom"
(interactive)
(let ((w (split-window-below (get-mini-size))) (tmp-eshell (get-buffer my-shell)))
    (select-window w)
    (if tmp-eshell
	(switch-to-buffer my-shell)
    (switch-to-buffer (eshell)))
    (eshell/cd default-directory)
    ))

;;;###autoload
(defun shell-pop-toggle ()
  "pop eshell or hide."
  (interactive)
  (if (get-buffer-window my-shell)
      (delete-windows-on my-shell)
	(shell-pop-bottom)
      ))

;;;###autoload
(define-minor-mode pop-shell-mode "my pop-shell mode")

(provide 'pop-shell-mode)
;;; my gradle-mode end.
