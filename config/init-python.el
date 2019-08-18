(use-package python
  :ensure nil
  :hook (python-mode . awesome-pair-mode)
  :config
  ;; (setq python-shell-completion-native-disabled-interpreters '("pypy" "ipython" "python" "ipython3"))
  (setq python-shell-interpreter "/home/luhuaei/.local/bin/ipython3"
	python-shell-interpreter-args "-i --pylab --simple-prompt --no-color-info")

  (use-package pipenv
    :ensure t
    :hook (python-mode . pipenv-mode)
    :init
    (setq
     pipenv-projectile-after-switch-function
     #'pipenv-projectile-after-switch-extended))
  (use-package lpy
    :ensure nil))

(provide 'init-python)
