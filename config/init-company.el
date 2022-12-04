;; -*- lexical-binding: t; -*-

(use-package company
  :after (init)
  :diminish company-mode
  :bind (("M-/" . company-complete)
         ("<backtab>" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . my-company-yasnippet)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :hook (prog-mode . company-mode)
  :config
  (setq company-tooltip-align-annotations nil ; aligns annotation to the right
	company-tooltip-limit 24              ; bigger popup window
	company-idle-delay 0.1                  ; decrease delay before autocompletion popup shows
	company-echo-delay 0.1                 ; remove annoying blinking
	company-minimum-prefix-length 1
	company-require-match nil
	company-dabbrev-ignore-case nil
	company-dabbrev-downcase nil
	company-show-number nil)

  ;; Nicer looking faces
  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
  )

(provide 'init-company)
