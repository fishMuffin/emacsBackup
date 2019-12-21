
(setq ring-bell-function 'ignore)
(global-linum-mode t)
(global-auto-revert-mode t)
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("fmi" "fishmuffin")
					    ))
(abbrev-mode t)
(setq make-backup-file nil)
(setq auto-save-default nil)
(require 'recentf)
(recentf-mode t)
(setq make-backup-file nil)
(setq auto-save-default nil)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(delete-selection-mode t)




;;format code
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region")
	  )
      (progn
	(indent-buffer)
	(message "Indented buffer."))
      
      )))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;;hipple
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))
;; Dired
;; +: to create directory
;; C-x C-f: to create file
;; g: refresh
;; C:copy file
;; D:delete file
;; u:undo
;; R:rename


(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired)
(require 'dired-x)
(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-dwim-target t)


;;hidden dos col
(defun hidden-dos-col ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(defun remove-dos-col()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


;;occur  dwin:do what i mean
;;(defun occur-dwin ()
  ;;(interactive)
;;  (push (if (region-active-p)
;;	    (buffer-substring-no-properties
;;	     (region-beginning+1)
;;	     (region-end))
;;	  (let ((sym (thing-at-point 'symbol)))
;;	    (when (string sym)
;;	      (regexp-quote sym))))
;;	regexp-history)
;;  (call-interactively 'occur))
;;(global-set-key (kbd "M-s o") 'occur-dwin)


;;encoding
(set-language-environment "UTF-8")

(require 'org-pomodoro)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(provide 'init-better-default)
