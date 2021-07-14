;; -*- lexical-binding: t; -*-
(use-package org
  :hook ((org-mode . org-indent-mode)
	 (org-mode . flyspell-mode))
  :bind (("C-c c" . 'org-capture)
	 ("C-c a" . 'org-agenda)
	 :map org-mode-map
	 ("C-c M-i" . 'interleave-mode)
         ("C-S-RET" . 'org-insert-subheading))
  :config
  (use-package ob-go :ensure nil :quelpa (ob-go :fetcher github :repo "pope/ob-go"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (emacs-lisp . t)
     (lisp . t)
     (shell . t)
     (R . t)
     (C . t)
     (sql . t)
     (dot . t)
     (go . t)))

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
	   "* TODO %?\n%U\n %a" :empty-lines 1)))
  (setq org-agenda-files '("~/org/")))

(use-package org-pomodoro
  :ensure nil
  :quelpa (org-pomodoro :fetcher github :repo "marcinkoziej/org-pomodoro"))

(provide 'init-org)
