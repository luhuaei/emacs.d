(use-package python
  :ensure nil
  :hook (python-mode . awesome-pair-mode)
  :bind (:map python-mode-map
	      ("C-<return>" . jupyter-eval-line-or-region))
  :config
  (setq python-shell-completion-native-disabled-interpreters '("pypy" "ipython" "python" "ipython3"))
  (setq python-shell-interpreter "/home/luhuaei/.local/bin/ipython3"
	python-shell-interpreter-args "-i --pylab --simple-prompt --no-color-info")

  (defun my-hide-jupyter-windows ()
    (interactive)
    (let ((d (get-buffer-window "*jupyter-display*"))
	  (r (get-buffer-window "*jupyter-result*"))
	  (o (get-buffer-window "*jupyter-output*"))
	  (tb (get-buffer-window "*jupyter-traceback*"))
	  (e (get-buffer-window "*jupyter-error*")))
      (cond
       (d (delete-window d))
       (r (delete-window r))
       (o (delete-window o))
       (tb (delete-window tb))
       (e (delete-window e))
       nil)))
  (advice-add #'keyboard-quit :before #'my-hide-jupyter-windows)

  (use-package pipenv
    :ensure t
    :hook (python-mode . pipenv-mode)
    :init
    (setq
     pipenv-projectile-after-switch-function
     #'pipenv-projectile-after-switch-extended))

  (use-package jupyter
    :ensure t
    :hook ((jupyter-repl-mode . awesome-pair-mode)
	   (jupyter-repl-mode . company-mode))))
(provide 'init-python)
