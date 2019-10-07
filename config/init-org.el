(use-package org
  :ensure nil
  :hook (org-mode . (lambda ()
		      (org-indent-mode)))
  :bind (("C-c c" . 'org-capture)
	 ("C-c a" . 'org-agenda))
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
     (jupyter . t)))

  ;; don't delete the fold content
  (setq org-catch-invisible-edits 'error)
  ;; don't prompt me to confirm everytime I want to evaluate a block
  (setq org-confirm-babel-evaluate nil)
  ;; display/update images in the buffer after I evaluate
  ;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
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
	  ("T" "Todo with Clipboard" entry (file "~/org/GTD.org")
	   "* TODO %?\n%U\n%c" :empty-lines 1)
	  ("n" "Note" entry (file "~/org/Note.org")
	   "* NOTE %?\n%U" :empty-lines 1)
	  ("N" "Note with Clipboard" entry (file "~/org/Note.org")
	   "* NOTE %?\n%U\n%c" :empty-lines 1)
	  ("e" "Event" entry (file+headline "~/org/Events.org" "Transient")
	   "* EVENT %?\n%U" :empty-lines 1)
	  ("E" "Event With Clipboard" entry (file+headline "~/org/Events.org" "Transient")
	   "* EVENT %?\n%U\n%c" :empty-lines 1))))

(use-package htmlize
  :ensure t)

(provide 'init-org)
