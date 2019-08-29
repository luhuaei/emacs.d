
(use-package org
  :ensure nil
  :hook (org-mode . (lambda ()
		      (org-indent-mode)))
  :bind (("C-c c" . 'org-capture))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (emacs-lisp . t)
     (lisp . t)
     (R . t)))

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
  (setq org-default-notes-file "~/org/gtd.org")
  (setq org-capture-templates
	'(("t" "TODO" checkitem (file+headline "~/org/gtd.org" "Tasks")
	   "* %?\n  %T\n %F\n %^G")
	  ("j" "Journal" plain (file+headline "~/org/journal.org" "Journal")
	   "%?\n keep on %U\n")
	  ("n" "keep note" item (file+headline "~/org/Note.org" "Note")
	   "%T\n  %?\n %i\n %^G"))))

(use-package htmlize
  :ensure t)

;; my blog template
(use-package org-static-blog
  :ensure nil
  :config
  (setq org-static-blog-publish-url "https://blog.luen.me/")
  (setq org-static-blog-publish-title "Blog")
  (setq org-static-blog-publish-directory "~/luhuaei.github.io/")
  (setq org-static-blog-posts-directory "~/luhuaei.github.io/posts/")
  (setq org-static-blog-drafts-directory "~/luhuaei.github.io/drafts/")
  (setq org-static-blog-index-file "index.html")
  (setq org-static-blog-index-length 5)
  (setq org-static-blog-archive-file "archive.html")
  (setq org-static-blog-tags-file "tags.html")
  (setq org-static-blog-rss-file "rss.xml")

  (setq org-static-blog-page-header
	"<meta charset=\"UTF-8\">
<link rel=\"alternate\"
      type=\"application/rss+xml\"
      href=\"https://blog.luen.me/rss.xml\"
      title=\"RSS feed for https://blog.luen.me/\"/>
<title>luen.me</title>

<meta name=\"author\" content=\"luhuaei\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href=\"static/style.css\" rel=\"stylesheet\" type=\"text/css\">
<link rel=\"icon\" href=\"static/favicon.ico\">
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>
<meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=UTF-8\">
<meta name=\"viewport\" content=\"initial-scale=1,width=device-width,minimum-scale=1\">")

  (setq org-static-blog-page-preamble
	"<div class=\"header\">
<a href=\"https://blog.luen.me\">Blog</a>
<div class=\"sitelinks\">
<a href=\"https://github.com/luhuaei\">Github</a> | <a href=\"about.html\">About</a>
</div>
</div>")

  (setq org-static-blog-page-postamble ""))

(provide 'init-org)
