(global-set-key (kbd "C-x j") 'nodejs-repl-send-buffer)
					;find function
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "M-x") 'smex)
					;swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "<f4>") 'open-my-init-file)

(global-set-key (kbd "C-c p f") 'counsel-git)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c j") 'goto-line)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
(global-set-key (kbd "M-s =") 'er/expand-region)

;;iedit-mode
(global-set-key (kbd "M-s e") 'iedit-mode)

(provide 'init-keybinds)
