(use-package ess
  :config
  (setq ess-ask-for-ess-directory nil)
  (setq display-buffer-alist
	`(("*R Dired"
           (display-buffer-reuse-window display-buffer-in-side-window)
           (side . right)
           (slot . -1)
           (window-width . 0.33)
           (reusable-frames . nil))
          ("*R"
           (display-buffer-reuse-window display-buffer-at-bottom)
           (window-width . 0.5)
           (reusable-frames . nil))))
  (setq ess-use-company t))

(provide 'init-ess)
