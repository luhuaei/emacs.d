(use-package dart-mode
  :quelpa (dart-mode :fetcher github :repo "bradyt/dart-mode")
  :mode "\\.dart$"
  :bind (:map dart-mode-map
              ("C-c M-f" . 'apheleia-format-buffer)))

(provide 'init-dart)
