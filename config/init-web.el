(use-package css-mode
  :ensure nil
  :init (setq css-indent-offset 2))

;; SCSS mode
(use-package scss-mode
  :ensure t
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

(use-package less-css-mode :ensure t)

;; CSS eldoc
(use-package css-eldoc
  :ensure t
  :commands turn-on-css-eldoc
  :hook ((css-mode scss-mode less-css-mode) . turn-on-css-eldoc))

;; JSON mode
(use-package json-mode :ensure t)

;; JavaScript
(use-package js2-mode
  :ensure t
  :defines flycheck-javascript-eslint-executable
  :mode (("\\.js\\'" . js2-mode)
         ("\\.jsx\\'" . js2-jsx-mode))
  :interpreter (("node" . js2-mode)
                ("node" . js2-jsx-mode))
  :hook ((js2-mode . js2-imenu-extras-mode)
         (js2-mode . js2-highlight-unused-variables-mode))
  :config
  (with-eval-after-load 'flycheck
    (when (or (executable-find "eslint_d")
              (executable-find "eslint")
              (executable-find "jshint"))
      (setq js2-mode-show-strict-warnings nil))
    (when (executable-find "eslint_d")
      ;; https://github.com/mantoni/eslint_d.js
      ;; npm -i -g eslint_d
      (setq flycheck-javascript-eslint-executable "eslint_d")))

  (use-package js2-refactor
    :ensure t
    :diminish
    :hook (js2-mode . js2-refactor-mode)
    :config (js2r-add-keybindings-with-prefix "C-c C-m")))

;; Live browser JavaScript, CSS, and HTML interaction
(use-package skewer-mode
  :ensure t
  :diminish
  :hook (((js-mode js2-mode). skewer-mode)
         (css-mode . skewer-css-mode)
         (web-mode . skewer-html-mode)
         (html-mode . skewer-html-mode))
  :init
  ;; diminish
  (with-eval-after-load 'skewer-css
    (diminish 'skewer-css-mode))
  (with-eval-after-load 'skewer-html
    (diminish 'skewer-html-mode)))

;; Typescript
(use-package typescript-mode :ensure t)

;; Run Mocha or Jasmine tests
(use-package mocha
  :ensure t
  :config (use-package mocha-snippets :ensure t))

;; Major mode for CoffeeScript code
(use-package coffee-mode
  :ensure t
  :config (setq coffee-tab-width 2))

;; Major mode for editing web templates
(use-package web-mode
  :ensure t
  :mode "\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\)$"
  :config
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))

;; Format HTML, CSS and JavaScript/JSON
;; Install: npm -g install prettier
(use-package prettier-js
  :ensure t
  :hook ((js-mode js2-mode json-mode web-mode css-mode sgml-mode html-mode)
         .
         prettier-js-mode))

(use-package haml-mode :ensure t)
(use-package php-mode :ensure t)

;; REST
(use-package restclient
  :ensure t
  :mode ("\\.http\\'" . restclient-mode)
  :config
  (use-package restclient-test
    :ensure t
    :diminish
    :hook (restclient-mode . restclient-test-mode))

  (with-eval-after-load 'company
    (use-package company-restclient
      :ensure t
      :defines company-backends
      :init (add-to-list 'company-backends 'company-restclient))))
(provide 'init-web)
