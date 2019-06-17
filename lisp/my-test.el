(provide 'my-test)

(defun notify (time msg)
  "notify at time .see `run-at-time' and `message-box'"
  (interactive)
  (run-at-time time nil #'notify_py msg)
  (concat "Toast at:" time))

(defun notify_hour (msg)
  "notify every hour"
  (interactive)
  (run-at-time 3600 3600 #'notify_py msg))

(defun notify_py (arg)
  (w32-shell-execute "open" (expand-file-name "py/t1.pyw" user-emacs-directory) arg))

