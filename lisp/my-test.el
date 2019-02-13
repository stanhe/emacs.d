(provide 'my-test)

(defun notify (time msg)
  "notify at time .see `run-at-time' and `message-box'"
  (interactive)
  (run-at-time time nil #'message-box msg)
  (concat "Toast at:" time))

