;;; Commentary:
;;
;; Packages & REPOS
;;
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(zenburn-theme monokai-theme
				    feature-mode dockerfile-mode terraform-mode
				    json-mode yaml-mode markdown-mode
				    coffee-mode css-mode scss-mode haml-mode 
				    rspec-mode
				    magit projectile grizzl ag
				    auto-complete
				    yasnippet yafolding
				    flymake flymake-ruby flymake-json
				    flycheck rubocop
				    expand-region
				    rvm
				    )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;
;; load path
;;
(add-to-list 'load-path "~/.emacs.d/vendor/rcodetools/")


;;
;; BAREBONES CONFIGURATION
;;
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

;; Map keys
(global-set-key (kbd "C-c C-p") '(lambda () (interactive) (previous-line 10)))
(global-set-key (kbd "C-c C-n") '(lambda () (interactive) (next-line 10)))

(global-set-key (kbd "C-c e") 'xmp)
(global-set-key (kbd "C-c r a") 'rubocop-autocorrect-current-file)



;;
;; PACKAGES
;;
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

;; uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; hooks
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
;;(require 'flymake-json)
;;(add-hook 'js-mode-hook 'flymake-json-load)
;;(add-hook 'text-mode-hook 'flyspell-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; (add-hook 'emacs-startup-hook 'windows-layout)

;; faces
(font-lock-add-keywords 'ruby-mode '(("\\(FIXME\\|TODO\\|OPTIMIZE\\):" 1 font-lock-warning-face prepend)))

;;
;; auto completion
;;
;;(require 'robe)
;;(add-hook 'ruby-mode-hook 'robe-mode)
;; ac
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)
;;(add-hook 'robe-mode-hook 'ac-robe-setup)
;; company
;; (add-hook 'after-init-hook 'global-company-mode)
;; (global-company-mode t)
;; (push 'company-robe company-backends)

;; git
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
     (set-face-background 'magit-item-highlight "black"))))
(defcustom magit-use-highlights nil
  "Custom colors"
  :group 'magit
  :type 'boolean)

;; project management
(require 'projectile)
(projectile-global-mode)
(setq projectile-require-project-root nil)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "C-c f") 'projectile-find-file)
(global-set-key (kbd "C-c a") 'projectile-ag)

;; folding
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

;; snippets
(yas-global-mode 1)
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; expand
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; re-build
(require 're-builder)
(setq reb-re-syntax 'string)

;; rcodetools
(require 'rcodetools)

;;
;; FUNCTIONS
;; 
(defun hashie()
  "Update to Ruby 1.9 hash style."
  (interactive)
  (backward-sexp)
  (delete-forward-char 1)
  (forward-sexp)
  (kill-forward-chars 3)
  (insert ":")
)
(global-set-key (kbd "C-c h") 'hashie)

(defun duplicate-line()
  "Duplicate current line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank)
)
(global-set-key (kbd "C-c d") 'duplicate-line)

(defun development-layout()
  "Split windows for development layout."
  (interactive)
  (split-window-horizontally)
  (split-window-vertically)
  ;(windmove-down)
  ;(shell-command 'guard)
  (windmove-right)
  (split-window-vertically)
 )
(global-set-key (kbd "C-c z") 'development-layout)


(defun kill-other-buffers()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-c k") 'kill-other-buffers)

(defun should-to-expect()
  "Change RSpec 'should' syntax to 'expect' syntax"
  (interactive)
  (let ((re "\\([a-z_'\.\?]+\\)")
	(rp "expect(\\1)"))
    (beginning-of-buffer)
    (query-replace-regexp (concat re ".should ") (concat rp ".to "))
    (beginning-of-buffer)
    (query-replace-regexp (concat re ".should_not ")
			  (concat rp ".not_to "))
    )
  )
(global-set-key (kbd "C-c x") 'should-to-expect)

(defun hash-to-hash()
  "Change RSpec 'should' syntax to 'expect' syntax"
  (interactive)
  (let ((re ":\\([a-z0-9?_]+\\) ?=> ?\\([a-z0-9: ?_'\.\"\\-]+\\)")
	(rp "\\1: \\2"))
    (beginning-of-buffer)
    (query-replace-regexp re rp))
  )
(global-set-key (kbd "C-c s") 'hash-to-hash)

;;
;; CUSTOMS
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((docker-image-name . "zuppler/ubuntu") (docker-image-name . "zuppler/nginx") (docker-image-name . "zuppler/portals")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
