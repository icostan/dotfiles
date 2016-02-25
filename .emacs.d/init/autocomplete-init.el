;;; autocomplete-init.el --- Autocomplete-init
;;; Commentary:
;;; Code:

;; auto-complete
(require 'auto-complete-config)
(setq ac-ignore-case 'smart)
(setq ac-auto-show-menu 1.0) ;; show menu after number of secs
(setq ac-auto-start 3) ;; starts after number of chars
(setq ac-quick-help-height 30)
;; (setq tab-always-indent 'complete)
;; (setq completion-cycle-threshold 5)
(ac-config-default)

(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

(provide 'autocomplete-init)

;;; autocomplete-init.el ends here
