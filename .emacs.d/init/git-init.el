;;; git-init.el --- Git-init
;;; Commentary:
;;; Code:

(require 'magit)
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log)
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

(provide 'git-init)

;;; git-init.el ends here
