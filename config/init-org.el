(use-package org
  :ensure nil
  :hook ((org-mode . org-indent-mode)
	 (org-mode . flyspell-mode))
  :bind (("C-c c" . 'org-capture)
	 ("C-c a" . 'org-agenda)
	 :map org-mode-map
	 ("C-c M-i" . 'interleave-mode))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (emacs-lisp . t)
     (lisp . t)
     (shell . t)
     (R . t)
     (C . t)
     (jupyter . t)
     (sql . t)
     (dot . t)))

  ;; don't delete the fold content
  (setq org-catch-invisible-edits 'error)
  ;; don't prompt me to confirm everytime I want to evaluate a block
  (setq org-confirm-babel-evaluate nil)
  ;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  (setq org-export-babel-evaluate nil)	;don't evaluate during exports
  (setq org-src-window-setup 'current-window)
  (setq org-log-done 'time)
  ;; org todo template
  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "DONE")
	  (sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
	  (sequence "|" "CANCELED")))
  (setq org-default-notes-file "~/org/GTD.org")
  (setq org-capture-templates
	'(("t" "Todo" entry (file "~/org/GTD.org")
	   "* TODO %?\n%U\n%^G" :empty-lines 1)
	  ("T" "Todo with File link" entry (file "~/org/GTD.org")
	   "* TODO %?\n%U\n %a" :empty-lines 1)
	  ("n" "Note" entry (file "~/org/Note.org")
	   "* NOTE %?\n%U" :empty-lines 1)
	  ("N" "Note with Clipboard" entry (file "~/org/Note.org")
	   "* NOTE %?\n%U\n%c" :empty-lines 1)
	  ("e" "Event" entry (file+headline "~/org/Events.org" "Transient")
	   "* EVENT %?\n%U" :empty-lines 1)
	  ("E" "Event With Clipboard" entry (file+headline "~/org/Events.org" "Transient")
	   "* EVENT %?\n%U\n%c" :empty-lines 1)
	  ("d" "Dream with idea" entry (file "~/org/Dream.org")
	   "* Idea %?\n%U\n%^G" :empty-lines 1)))
  (setq org-agenda-files '("~/org/")))

(use-package org-ehtml
  :config
  (setq org-ehtml-docroot (expand-file-name "~/org"))
  (setq org-ehtml-allow-agenda t)
  (setq org-ehtml-everything-editable nil)
  (setq org-ehtml-style (concat "<style>"
				(with-temp-buffer
				  (insert-file-contents "~/.scripts/style.css")
				  (buffer-string))
				"</style>"))
  (setq org-ehtml-dir-match "^\\([^.].*[^~]\\|\\.\\.\\)$")
  ;; (ws-start org-ehtml-handler 1608)
  )

(use-package htmlize)

(provide 'init-org)
