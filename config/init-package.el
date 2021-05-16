;; -*- lexical-binding: t; -*-
(require 'use-package)
(setq use-package-always-ensure nil)
(setq use-package-always-defer nil)

(use-package quelpa
  :ensure nil
  :load-path emacs-extension-dir)

(use-package quelpa-use-package
  :load-path emacs-extension-dir
  :config
  (setq quelpa-update-melpa-p nil))

(provide 'init-package)
