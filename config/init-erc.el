
(use-package erc
  :ensure t
  :config
  (require 'socks)
  (setq socks-server (list "My erc scoks server" "127.0.0.1" 1080 5))
  (setq socks-noproxy '("localhost"))
  (setq erc-server-connect-function 'socks-open-network-stream))

(provide 'init-erc)
