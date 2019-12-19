
(setq ring-bell-function 'ignore)
(global-linum-mode t)
(global-auto-revert-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("fmi" "fishmuffin")
					    ))
(abbrev-mode t)
(setq make-backup-file nil)
(setq auto-save-default nil)
(require 'recentf)
(recentf-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(provide 'init-better-default)
