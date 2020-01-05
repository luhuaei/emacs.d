(use-package ox-publish
  :ensure nil
  :config
  (require 'ox-html)
  (require 'org-element)
  (defun org-blog-prepare (project-plist)
    "With help from `https://github.com/howardabrams/dot-files'.
  Touch `index.org' to rebuilt it.
  Argument `PROJECT-PLIST' contains information about the current project."
    (let* ((base-directory (plist-get project-plist :base-directory))
           (buffer (find-file-noselect (expand-file-name "index.org" base-directory) t)))
      (with-current-buffer buffer
	(set-buffer-modified-p t)
	(save-buffer 0))
      (kill-buffer buffer)))

  (defvar org-blog-head
    "
<meta name=\"google-site-verification\" content=\"dVWCUwH8eYXavYgAUJtgmzwlXVIcYZeyvlUolZQVb2E\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"/assets/css/style.css\"/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>
<link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"favicon.ico\">")

  (defun org-blog-preamble (_plist)
    "Pre-amble for whole blog."
    "
<div class=\"\">
    <a href=\"/\"> Luhua.ei </a>
</div>
<ul class=\"\">
  <li><a href=\"/about.html\"> About Me </a> </li>
  <li><a href=\"https://github.com/luhuaei\"> Github </a> </li>
  <li><a href=\"/archive.html\"> Posts </a> </li>
</ul>
  <hr>")

  (defun org-blog-postamble (plist)
    "Post-amble for whole blog."
    (concat
     "<footer class=\"footer\">
      <!-- Footer Definition -->
   </footer>

  <!-- Google Analytics Js -->"

     ;; Add Disqus if it's a post
     (when (s-contains-p "/posts/" (plist-get plist :input-file))
       "<!-- Disqua JS --> ")))

  (defun org-blog-sitemap-format-entry (entry _style project)
    "Return string for each ENTRY in PROJECT."
    (when (s-starts-with-p "posts/" entry)
      (format "@@html:<span class=\"archive-item\"><span class=\"archive-date\">@@ %s @@html:</span>@@ [[file:%s][%s]] @@html:</span>@@"
              (format-time-string "%h %d, %Y"
                                  (org-publish-find-date entry project))
              entry
              (org-publish-find-title entry project))))

  (defun org-blog-sitemap-function (title list)
    "Return sitemap using TITLE and LIST returned by `org-blog-sitemap-format-entry'."
    (concat "#+TITLE: " title "\n\n"
            "\n#+begin_archive\n"
            (mapconcat (lambda (li)
			 (format "@@html:<li>@@ %s @@html:</li>@@" (car li)))
                       (seq-filter #'car (cdr list))
                       "\n")
            "\n#+end_archive\n"))

  (defun org-blog-publish-to-html (plist filename pub-dir)
    "Same as `org-html-publish-to-html' but modifies html before finishing."
    (let ((file-path (org-html-publish-to-html plist filename pub-dir)))
      (with-current-buffer (find-file-noselect file-path)
	(goto-char (point-min))
	(search-forward "<body>")
	(insert (concat "\n<div class=\"content-wrapper container\">\n "
			"  <div class=\"row\"> <div class=\"col\"> </div> "
			"  <div class=\"col-sm-6 col-md-8\"> "))
	(goto-char (point-max))
	(search-backward "</body>")
	(insert "\n</div>\n<div class=\"col\"></div></div>\n</div>\n")
	(save-buffer)
	(kill-buffer))
      file-path))

  (setq org-publish-project-alist
	`(("orgfiles"
           :base-directory "~/blog/src"
           :exclude "drafts/.*"
           :base-extension "org"

           :publishing-directory "~/blog"

           :recursive t
           :preparation-function org-blog-prepare
           :publishing-function org-blog-publish-to-html

           :with-toc nil
           :with-title t
           :with-date t
           :section-numbers nil
           :html-doctype "html5"
           :html-html5-fancy t
           :html-head-include-default-style nil
           :html-head-include-scripts nil
           :htmlized-source t
           :html-head-extra ,org-blog-head
           :html-preamble org-blog-preamble
           :html-postamble org-blog-postamble

           :auto-sitemap t
           :sitemap-filename "archive.org"
           :sitemap-title "Blog Posts"
           :sitemap-style list
           :sitemap-sort-files anti-chronologically
           :sitemap-format-entry org-blog-sitemap-format-entry
           :sitemap-function org-blog-sitemap-function)


          ("data"
           :base-directory "~/blog/src/posts/"
	   :base-extension "csv\\|pdf"
           :publishing-directory "~/blog/posts/"
           :publishing-function org-publish-attachment
           :recursive t)

	  ("images"
	   :base-directory "~/blog/src/posts/"
	   :base-extension "jpg\\|gif\\|png"
	   :publishing-directory "~/blog/posts/"
	   :publishing-function org-publish-attachment
	   :recursive t)

          ("blog" :components ("orgfiles" "data" "images"))))
  )

(defun my-new-post ()
    (interactive)
    (let ((filename (read-string "Filename: ")))
      (find-file (concat "~/blog/src/posts/" filename ".org"))
      (insert "#+title:  "  "\n"
	      "#+date: " (format-time-string "[%Y-%m-%d %H:%M]") "\n")))

(provide 'init-blog)
