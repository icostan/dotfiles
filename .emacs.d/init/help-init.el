;;; help-init.el --- Help-init
;;; Commentary:
;;; Code:

(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right)

(require 'helm-descbinds)
(helm-descbinds-mode)

(require 'discover)
(global-discover-mode 1)

(provide 'help-init)

;;; help-init.el ends here
