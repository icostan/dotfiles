;; Package Manager
(require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
(cask-initialize)

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

;; Windows navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; File Associations
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("bash" . shell-script-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-to-list 'auto-mode-alist '("Cask$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))

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

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-require-project-root nil)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-c f") 'helm-projectile)
(global-set-key (kbd "C-c g h") 'helm-projectile-grep)
(global-set-key (kbd "C-c g p") 'projectile-grep)

;; git
(require 'magit)
(global-set-key (kbd "C-c m") 'magit-status)

;; flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)
(global-set-key (kbd "C-c r a") 'rubocop-autocorrect-current-file)
