;;; package --- Summary Ruby
;;; Code:
;;; Commentary:

;;; Settings
(setq ruby-deep-indent-paren nil)

;; File associations
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;;; RVM support
(require 'rvm)
(add-hook 'ruby-mode-hook 'rvm-activate-corresponding-ruby)

;;; Robe
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;;; Rspec
(require 'rspec-mode)
(setq rspec-use-rake-when-possible nil)
(setq compilation-scroll-output 'first-error)

;;; Functions to help with refactoring
(require 'ruby-refactor)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
(require 'ruby-hash-syntax) ;; Easily toggle ruby's hash syntax
(require 'ruby-tools) ;; Helpers to deal with strings and symbols

;;; (provide 'ruby)

;;; ruby.el ends here
