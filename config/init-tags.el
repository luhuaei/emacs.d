;; -*- lexical-binding: t; -*-

(use-package counsel-etags
  :after (ivy)
  :quelpa (counsel-etags :fetcher github :repo "redguardtoo/counsel-etags")
  :bind (("C-]" . counsel-etags-find-tag-at-point))
  :init
  (add-hook 'prog-mode-hook
            (lambda ()
              (add-hook 'after-save-hook
                        'counsel-etags-virtual-update-tags 'append 'local)))
  :config
  (setq counsel-etags-update-interval 60)
  (push "build" counsel-etags-ignore-directories))

(provide 'init-tags)
