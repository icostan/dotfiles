;;
;; PACKAGES & REPOS
;;
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(zenburn-theme monokai-theme 
				    json-mode feature-mode dockerfile-mode terraform-mode
				    magit projectile grizzl auto-complete ag yasnippet yafolding
				    flymake flymake-ruby flymake-json 
				    flycheck rubocop)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))



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

;; Colors
(set-face-foreground 'minibuffer-prompt "green")
(set-cursor-color "firebrick")

;; Control Keys
(setq mac-command-modifier 'control)

;; Show keystrokes
(setq echo-keystrokes 1)

;; Windows navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Map keys
(global-set-key (kbd "C-c C-p") '(lambda () (interactive) (previous-line 25)))
(global-set-key (kbd "C-c C-n") '(lambda () (interactive) (next-line 25)))



;;
;; PACKAGES
;;
;; File Associations
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("bash" . shell-script-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; hooks
;;(add-hook 'after-init-hook 'global-flycheck-mode)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(require 'flymake-json)
(add-hook 'js-mode-hook 'flymake-json-load)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; auto-complete
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

;; git
(require 'magit)
(global-set-key (kbd "C-c C-i") 'magit-status)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
     (set-face-background 'magit-item-highlight "black"))))
(defcustom magit-use-highlights nil
  "Use highlights in diff buffer."
  :group 'magit
  :type 'boolean)

;; project management
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "C-c C-f") 'projectile-find-file)
(global-set-key (kbd "C-c C-g") 'projectile-ag)

;; folding
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

;; snippets
(yas-global-mode 1)


;;
;; FUNCTIONS
;; 
(defun hashie()
  (interactive)
  (backward-sexp)
  (delete-forward-char 1)
  (forward-sexp)
  (kill-forward-chars 3)
  (insert ":")
)
(global-set-key (kbd "C-c C-h") 'hashie)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank)
)
(global-set-key (kbd "C-c C-d") 'duplicate-line)

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
