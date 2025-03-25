;; -*- lexical-binding: t; -*-

;; benchmark init
;; (require 'benchmark-init-loaddefs)
;; (benchmark-init/activate)

;; (require 'benchmark-init)
;; (add-hook 'after-init-hook 'benchmark-init/deactivate)

(let ()
  ;; 定义一些启动目录，方便下次迁移修改
  (defvar emacs-root-dir (file-truename "~/emacs.d"))
  (defvar emacs-config-dir (concat emacs-root-dir "/config"))
  (defvar emacs-extension-dir (concat emacs-root-dir "/extensions"))
  (defvar emacs-org-dir "~/luhuaei.github.io/drafts/")

  (with-temp-message ""                 ;抹掉插件启动的输出
    (require 'init-package)
    (require 'init-startup)
    (require 'init-theme)
    (require 'init-vc)
    (require 'init-utils)
    ;; (require 'init-eaf)
    (require 'init-program)
    (require 'init-buffer)
    (require 'init-text)
    (require 'init-tree-sitter)
    ;; (require 'init-corfu)
    (require 'init-lsp)
    (require 'init-test)
    ))
(provide 'init)
