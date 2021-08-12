;; -*- lexical-binding: t; -*-

(use-package lua-mode
  :defer t
  :quelpa (lua-mode :fetcher github :repo "immerrr/lua-mode")
  :mode "\\.\\(lua\\)$")

(provide 'init-lua)
