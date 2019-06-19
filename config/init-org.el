
(use-package org
  :ensure nil
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (emacs-lisp . t)
     (lisp . t)
     (R . t)))

  ;; don't prompt me to confirm everytime I want to evaluate a block
  (setq org-confirm-babel-evaluate nil)
  ;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  (setq org-src-window-setup 'current-buffer))

(use-package htmlize
  :ensure t)

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
