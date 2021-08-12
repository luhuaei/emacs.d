;; -*- lexical-binding: t; -*-

(use-package company
  :after (ivy)
  :quelpa (company-mode :fetcher github :repo "company-mode/company-mode" :files ("icons" "*.el"))
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
	company-idle-delay 0                  ; decrease delay before autocompletion popup shows
	company-echo-delay .2                 ; remove annoying blinking
	company-minimum-prefix-length 3
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

(use-package prescient
  :after (company)
  :quelpa (prescient :fetcher github :repo "raxod502/prescient.el" :files ("ivy-prescient.el" "company-prescient.el" "prescient.el"))
  :init (progn
          (company-prescient-mode 1)))

(use-package company-quickhelp
  :after (company)
  :quelpa (company-quickhelp :fetcher github :repo "company-mode/company-quickhelp")
  :defines company-quickhelp-delay
  :bind (:map company-active-map
	      ("C-c h" . company-quickhelp-manual-begin))
  :hook (global-company-mode . company-quickhelp-mode)
  :init (setq company-quickhelp-delay 0.5))

(use-package company-ctags
  :after (company)
  :quelpa (company-ctags :fetcher github :repo "redguardtoo/company-ctags")
  :config
  (with-eval-after-load 'company
    (company-ctags-auto-setup))
  (setq company-ctags-extra-tags-files '("$HOME/TAGS" "/usr/include/TAGS")))


(provide 'init-company)
