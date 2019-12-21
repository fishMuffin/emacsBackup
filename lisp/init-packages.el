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
		       web-mode
		       expand-region
		       iedit
		       org-pomodoro
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 )
       auto-mode-alist))
(global-company-mode t)
(load-theme 'monokai' t)
(require 'popwin)
(popwin-mode t)


;;config for web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(defun my-toggle-web-indent ()
  (interactive)
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2)4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2)4 2))
	))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))
	     ))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2))
    (setq indent-tabs-mode nil)
    )
  )


;;config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;expand-region
(require 'expand-region)






(require 'nodejs-repl)

(electric-indent-mode t)

(require 'smex)
(smex-initialize)
(setq recentf-max-menu-items 25)

(provide 'init-packages)
