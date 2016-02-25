;;; projectile-iit.el --- Projectile-init
;;; Commentary:
;;; Code:

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-require-project-root nil)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'projectile-dired)
(persp-mode)
(require 'persp-projectile)
(global-set-key (kbd "C-c f") 'helm-projectile)
(global-set-key (kbd "C-c g h") 'helm-projectile-grep)
(global-set-key (kbd "C-c g p") 'projectile-grep)
(global-set-key (kbd "C-c s") 'projectile-persp-switch-project)

(provide 'projectile-init)

;;; projectile-init.el ends here
