;;; eidting-init.el --- Editing tools
;;; Commentary:
;;; Code:

(setq backup-inhibited t) ;; disable backups
(setq auto-save-default nil) ;; disable autosaving

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-?") 'mc/mark-all-like-this)
(global-set-key (kbd "C-|") 'mc/edit-lines)

(require 'smartparens-config)

(provide 'editing-init)

;;; editing-init.el ends here

