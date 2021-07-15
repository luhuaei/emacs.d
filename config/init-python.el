;; -*- lexical-binding: t; -*-
(use-package python
  :ensure nil
  :hook (python-mode . awesome-pair-mode)
  :bind (:map python-mode-map
	      ("C-<return>" . jupyter-eval-line-or-region)
              ("M-\." . #'dumb-jump-go)
              ("M-\," . #'dumb-jump-back))
  :config
  (setq python-shell-completion-native-disabled-interpreters '("pypy" "ipython" "python" "ipython3"))
  (setq python-shell-interpreter "~/.local/bin/ipython3"
	python-shell-interpreter-args "-i --pylab --simple-prompt --no-color-info")

  (defun my-jupyter-next-line (insert)
    (let ((status (use-region-p)))
      (if status
	  (goto-char (cdar (region-bounds)))
	nil)
      (beginning-of-line)
      (next-line)
      (end-of-line)
      (if status (keyboard-quit) nil)))

  (advice-add #'jupyter-eval-line-or-region :after #'my-jupyter-next-line)

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
  ;; (advice-add #'keyboard-quit :before #'my-hide-jupyter-windows)

  (use-package pipenv
    :ensure nil
    :quelpa (pipenv :fetcher github :repo "pwalsh/pipenv.el")
    :diminish pipenv-mode-hook
    :init
    (setq
     pipenv-projectile-after-switch-function
     #'pipenv-projectile-after-switch-extended))

  (use-package emacs-jupyter
    :ensure nil
    :quelpa (emacs-jupyter :fetcher github :repo "nnicandro/emacs-jupyter")
    :hook ((jupyter-repl-mode . awesome-pair-mode)
	   (jupyter-repl-mode . company-mode))))
(provide 'init-python)
