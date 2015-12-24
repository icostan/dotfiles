;;; markdown-init.el --- markdown-init
;;; commentary:
;;; code:

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'markdown-preview-mode)
;;(setq markdown-preview-style "https://gist.github.com/andyferra/2554919/raw/10ce87fe71b23216e3075d5648b8b9e56f7758e1/github.css")

(define-key markdown-mode-map (kbd "C-c C-c p") 'markdown-preview-mode)

(provide 'markdown-init)

;;; markdown-init.el ends here
