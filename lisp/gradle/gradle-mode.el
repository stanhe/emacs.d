;; this is my custom gradle-mode
;; main for project with gradle
;; author: stanhe
;; date: 2018-10-18

(defun get-root-dir ()
  "Get the project dir."
  (locate-dominating-file default-directory "gradlew"))


(defun gradle-run-project-root (task)
  "Run gradle task in project root dir."
  (let ((root (get-root-dir)))
    (when root
      (cd root)
      (shell-command (concat "./gradlew " task)))))

;;;###autoload
(defun gradle-task (task)
  (interactive "sTask:")
  (gradle-run-project-root task))

;;;###autoload
(defun gradle-run ()
  (interactive)
  (gradle-run-project-root "run"))

(defun gradle-assemble ()
  (interactive)
  (gradle-run-project-root "assemble"))

(defun gradle-clean ()
  (interactive)
  (gradle-run-project-root "clean"))

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

;;;###autoload
(add-hook 'java-mode-hook 'gradle-mode)

(provide 'gradle-mode)

;;; my gradle-mode end.
