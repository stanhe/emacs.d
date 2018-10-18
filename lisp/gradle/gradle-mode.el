;; this is my custom gradle-mode

(defun get-root-dir ()
  (locate-dominating-file default-directory "gradlew"))

;;;###autoload
(defun gradle-task (task)
  (interactive "sTask:")
  (cd (get-root-dir))
  (shell-command (concat "./gradlew " task)))

;;;###autoload
(defun gradle-run ()
  (interactive)
  (cd (get-root-dir))
  (shell-command "./gradlew run"))

(defun gradle-assemble ()
  (interactive)
  (cd (get-root-dir))
  (shell-command "./gradlew assemble"))

(defun gradle-clean ()
  (interactive)
  (cd (get-root-dir))
  (shell-command "./gradlew clean"))

(defvar gradle-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-u t") 'gradle-task)
    (define-key map (kbd "C-c C-u r") 'gradle-run)
    (define-key map (kbd "C-c C-u a") 'gradle-assemble)
    (define-key map (kbd "C-c C-u c") 'gradle-clean)
  map)
  "gradle mode key maps."
  )

;;;###autoload
(define-minor-mode gradle-mode "my gradle mode")

(provide 'gradle-mode)
