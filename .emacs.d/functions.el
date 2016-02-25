;;; package --- Summary
;;; Code:
;;; Commentary:

(defun duplicate-line()
  "Duplicate current line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (newline)
  (yank)
  )
(global-set-key (kbd "C-c d") 'duplicate-line)

(defun development-layout()
  "Split windows for development layout."
  (interactive)
  (toggle-frame-fullscreen)
  (robe-start t)
  (split-window-horizontally)
  (split-window-vertically)
  ;; (windmove-down)
  ;; (eshell)
  (ruby-guard)
  (windmove-right)
  )
(global-set-key (kbd "C-c z") 'development-layout)

(defun should-to-expect()
  "Change RSpec 'should' syntax to 'expect' syntax"
  (interactive)
  (let ((re "\\([][@,0-9a-z_':\.\?]+?\\)")
	(rp "expect(\\1)"))
    (goto-char (point-min))
    (query-replace-regexp (concat re ".should ") (concat rp ".to "))
    (goto-char (point-min))
    (query-replace-regexp (concat re ".should_not ")
			  (concat rp ".not_to "))
    )
  )
(global-set-key (kbd "C-c x") 'should-to-expect)

;;; (provide 'functions)

;;; functions.el ends here
