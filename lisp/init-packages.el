(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)
(defvar ycw/packages '(
		       monokai-theme
		       hungry-delete
		       smex
		       swiper
		       counsel
		       smartparens
		       js2-mode
		       nodejs-repl
		       popwin
		       ) "Default packages")
(setq package-selected-packages ycw/packages)
(defun ycw/packages-installed-p ()
  (loop for pkg in ycw/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (ycw/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg ycw/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
(require 'hungry-delete)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
 (ivy-mode 1)
(setq ivy-use-virtual-buffers t)

					;delete-hungry-mode
(global-hungry-delete-mode)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(global-company-mode t)
(load-theme 'monokai' t)
(require 'popwin)
(popwin-mode t)


(require 'nodejs-repl)

(electric-indent-mode t)

(require 'smex)
(smex-initialize)
(setq recentf-max-menu-items 25)

(provide 'init-packages)
