(package-install 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)

(use-package quelpa-use-package
  :config
  (setq quelpa-update-melpa-p nil))

(provide 'init-package)
