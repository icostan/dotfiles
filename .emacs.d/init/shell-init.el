;;; shell-init.el --- Bash/Zsh shells
;;; Commentary:
;;; Code:

(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-to-list 'auto-mode-alist '(".zshrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '(".bashrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '("bash" . shell-script-mode))

(require 'comint)
(setq comint-scroll-to-bottom-on-input 'this)
(setq comint-scroll-to-bottom-on-output 'this)

(provide 'shell-init)

;;; shell-init.el ends here
