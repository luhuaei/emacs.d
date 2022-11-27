;; -*- lexical-binding: t; -*-
(require 'use-package)
(setq use-package-always-ensure nil)
(setq use-package-always-defer nil)

(use-package quelpa
  :load-path emacs-extension-dir)

(use-package quelpa-use-package
  :load-path emacs-extension-dir
  :config
  (setq quelpa-update-melpa-p nil))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(provide 'init-package)
