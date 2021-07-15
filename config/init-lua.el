;; -*- lexical-binding: t; -*-

(use-package lua-mode
  :ensure nil
  :quelpa (lua-mode :fetcher github :repo "immerrr/lua-mode")
  :mode "\\.\\(lua\\)$")

(provide 'init-lua)
