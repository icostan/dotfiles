;;; feature-init.el --- Cucumber init
;;; Commentary:
;;; Code:

(require 'feature-mode)
(setq feature-use-rvm t)
(setq feature-cucumber-command "cucumber {options} {feature}")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'feature-init)

;;; feature-init.el ends here
