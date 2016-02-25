;;; helm-init.el --- Helm-init
;;; Commentary:
;;; Code:

;; Helm
(require 'helm)
(require 'helm-config)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-split-window-in-side-p t)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(set-face-attribute 'helm-selection nil
		    :background "purple"
		    :foreground "black")
(helm-autoresize-mode 1)
(helm-mode 1)

;;; Helm-Dash
(global-set-key (kbd "C-c h d") 'helm-dash)
(setq helm-dash-browser-func 'eww)
(setq helm-dash-common-docsets '("bash" "css" "html" "javascript"
				 "haml" "coffeescript" "markdown"
				 "mongodb" "redis" "postgresql"
				 "emacs_lisp"))

(provide 'helm-init)

;;; helm-init.el ends here
