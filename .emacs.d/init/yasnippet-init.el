;;; yasnippet-init.el --- yasnippet-init
;;; Commentary:
;;; Code:

(require 'yasnippet)
(yas-global-mode 1)
;;; (yas-reload-all)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

(provide 'yasnippet-init)

;;; yasnippet-init.el ends here

