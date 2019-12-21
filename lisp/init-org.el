(require 'org)
(setq org-src-fontify-natively t)
;(setq org-default-notes-file (concat org-directory "~/.emacs.d/gtd.org"))
(setq org-agenda-files '("~/.emacs.d"))
(setq org-capture-templetes
      '(("t" "TODO" entry (file+headline "~/.emacs.d/gtd.org" "work plan")
	 "* TODO [#8] %?\n %i\n"
	 :empty-lines 1)))

(provide 'init-org)
