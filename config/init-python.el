(use-package python
  :ensure nil
  :config

  (use-package lpy
    :ensure nil
    :defer t
    :hook (python-mode . lpy-mode))
  (use-package pipenv
    :ensure t
    :hook (python-mode . pipenv-mode)
    :init
    (setq
     pipenv-projectile-after-switch-function
     #'pipenv-projectile-after-switch-extended)))
(provide 'init-python)
