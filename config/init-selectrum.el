;; -*- lexical-binding: t; -*-

(use-package selectrum-prescient)

(use-package selectrum
  :ensure nil
  :quelpa (selectrum :fetcher github :repo "raxod502/selectrum")
  :config
  (selectrum-mode +1)

  ;; to make sorting and filtering more intelligent
  (selectrum-prescient-mode +1)

  ;; to save your command history on disk, so the sorting gets more
  ;; intelligent over time
  (prescient-persist-mode +1))

(provide 'init-selectrum)
