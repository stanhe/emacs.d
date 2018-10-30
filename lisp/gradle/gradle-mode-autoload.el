;;; gradle-mode-autoload.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "gradle-mode" "gradle-mode.el" (23496 26023
;;;;;;  987806 553000))
;;; Generated autoloads from gradle-mode.el

(autoload 'gradle-task "gradle-mode" "\


\(fn TASK)" t nil)

(autoload 'gradle-run "gradle-mode" "\


\(fn)" t nil)

(autoload 'gradle-mode "gradle-mode" "\
my gradle mode

\(fn &optional ARG)" t nil)

(add-hook 'java-mode-hook 'gradle-mode)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "gradle-mode" '("get-root-dir" "gradle-")))

;;;***

(provide 'gradle-mode-autoload)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; gradle-mode-autoload.el ends here
