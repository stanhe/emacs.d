;;; pop-eshell-mode-autoload.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "pop-eshell-mode" "pop-eshell-mode.el" (23513
;;;;;;  8797 0 0))
;;; Generated autoloads from pop-eshell-mode.el

(autoload 'fast-eshell-pop "pop-eshell-mode" "\
fast jump to eshll,it's the same as M-x :eshell 

\(fn)" t nil)

(autoload 'eshell-pop-toggle "pop-eshell-mode" "\
pop eshell or hide.

\(fn)" t nil)

(defvar pop-eshell-mode nil "\
Non-nil if Pop-Eshell mode is enabled.
See the `pop-eshell-mode' command
for a description of this minor mode.")

(custom-autoload 'pop-eshell-mode "pop-eshell-mode" nil)

(autoload 'pop-eshell-mode "pop-eshell-mode" "\
my pop eshell mode

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pop-eshell-mode" '("pre-pa" "pop-eshell-mode-map" "get-" "my-")))

;;;***

(provide 'pop-eshell-mode-autoload)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pop-eshell-mode-autoload.el ends here
