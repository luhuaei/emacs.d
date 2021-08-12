;; -*- lexical-binding: t; -*-
(use-package markdown-mode
  :defer t
  :quelpa (markdown-mode :fetcher github :repo "projects/markdown-mode")
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
