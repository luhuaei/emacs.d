;; -*- lexical-binding: t; -*-
(when (display-graphic-p)
  (set-face-attribute
   'default nil
   :font (font-spec :name "WenQuanYi Micro Hei Mono"
                    :weight 'normal
                    :slant 'normal
                    :size 18.0)))

(use-package monokai-theme
  :quelpa (monokai-theme :fetcher github :repo "oneKelvinSmith/monokai-emacs")
  :config
  (load-theme 'monokai t))

(provide 'init-theme)
