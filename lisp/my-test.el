(provide 'my-test)

(defun notify (time msg)
  "notify at time .see `run-at-time' and `message-box'"
  (interactive)
  (run-at-time time nil #'notify_py msg)
  (concat "Toast at:" time))

(defun notify_hour (msg)
  "notify every hour"
  (interactive)
  (let ((interval (* 3 3600)))
    (run-at-time interval interval #'notify_py msg)) ;;notify every 3 hour
  ;;(run-at-time 5 10 #'notify_py msg)
  )

(defun notify_py (arg)
  (w32-shell-execute "open" (expand-file-name "py/t1.pyw" user-emacs-directory) arg))

;;for rest my eyes
(defun start-rest-timer()
  (interactive)
  (cancel-rest-timer)
  (setq mRestTimer (notify_hour "have a rest!")))

(defun cancel-rest-timer()
  (interactive)
  (ignore-errors
    (cancel-timer mRestTimer)))

(start-rest-timer)
