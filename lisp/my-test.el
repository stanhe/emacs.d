(provide 'my-test)

(defun notify (time msg)
  "notify at time .see `run-at-time' and `message-box'"
  (interactive)
  (concat "Toast at:" time)
  (run-at-time time nil #'notify_py msg))

(defun notify_hour (msg)
  "notify every 1 hour"
  (interactive)
  (let ((interval (* 1 3600)))
    (run-at-time interval interval #'notify_py msg)) ;;notify every 1 hour
  ;;(run-at-time 5 10 #'notify_py msg)
  )

(defun notify_py (arg)
  (w32-shell-execute "open" (expand-file-name "py/t1.pyw" user-emacs-directory) arg))

;;for rest my eyes
(defun start-rest-timer()
  "for rest my eyes!"
  (interactive)
  (cancel-rest-timer)
  (setq mRestTimer (notify_hour "have a rest!")))

(defun cancel-rest-timer()
  "stop reset timer!"
  (interactive)
  (ignore-errors
    (cancel-timer mRestTimer)))

(start-rest-timer)
(notify "11:00" "请开始点餐！！！")
(notify "17:30" "请注意下班打卡！！！")
(run-at-time "17:30" nil #'cancel-rest-timer)
