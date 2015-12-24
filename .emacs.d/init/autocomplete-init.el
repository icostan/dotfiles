;;; autocomplete-init.el --- Autocomplete-init
;;; Commentary:
;;; Code:

;; auto-complete
(require 'auto-complete-config)
(setq ac-ignore-case nil)
(setq ac-auto-show-menu t)
(setq ac-auto-start t)
(setq ac-quick-help-height 30)
(ac-config-default)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

(provide 'autocomplete-init)

;;; autocomplete-init.el ends here
