;;; init.el --- Emacs initialization
;;; Commentary:
;;; Code:

;; Package Manager
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Load-path
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "langs" user-emacs-directory))
(let ((default-directory  (expand-file-name "plugins" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; Env
(exec-path-from-shell-initialize)

;; Theme
(load-theme 'monokai t)

;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Turn off UI bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line and column #
(line-number-mode t)
(column-number-mode t)

;; Colors
(set-face-foreground 'minibuffer-prompt "green")
(set-cursor-color "firebrick")

;; Control Keys
(setq mac-command-modifier 'control)

;; anzu - shows a count of search matches in the mode-line
(require 'anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; Display continuous lines
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; fullframe - display next command in full frame
(require 'fullframe)
(fullframe magit-status magit-mode-quit-window nil)
(fullframe magit-log magit-mode-quit-window nil)
(fullframe yas-describe-tables quit-window nil)

;; electrics
;; (electric-pair-mode 1)
;; (electric-indent-mode 1)

;; wakatime
;;; (require 'wakatime-mode)
;;; (global-wakatime-mode)

;; Load custom lisp functions
(load "~/.emacs.d/functions.el")

;; Inits
(require 'helm-init)
(require 'projectile-init)
(require 'editing-init)
(require 'navigation-init)
(require 'yasnippet-init)
(require 'autocomplete-init)
(require 'markdown-init)
(require 'feature-init)
(require 'git-init)
(require 'shell-init)
(require 'help-init)
(require 'docker-init)
(require 'yaml-init)

;; Langs
(require 'lisp-init)
(require 'ruby-init)
(require 'css-init)
(require 'html-init)
(require 'prolog-init)
(require 'elixir-init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-use-overlays nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(wakatime-api-key "208f5b28-4f11-4774-a132-cb455398d199")
 '(wakatime-cli-path "/usr/local/bin/wakatime"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; (provide 'init)

;;; init.el ends here
