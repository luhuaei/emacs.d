;; -*- lexical-binding: t; -*-
(when (display-graphic-p)
  (set-face-attribute
   'default nil
   :font (font-spec :name "WenQuanYi Micro Hei Mono"
                    :weight 'normal
                    :slant 'normal
                    :size 15.0)))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(provide 'init-theme)
