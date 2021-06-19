;; -*- lexical-binding: t; -*-

;; fonts
(when (display-graphic-p)
  (set-face-attribute
   'default nil
   :font (font-spec :name "-APPL-Monaco-*-*-*-*-*-*-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 15.0))

  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-STON-幼圆-*-*-*-*-*-d-0-iso10646-1"
                :weight 'normal
                :slant 'normal
                :size 15.0))))

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))
  ;; 定义一些启动目录，方便下次迁移修改
  (defvar emacs-root-dir (file-truename "~/emacs.d"))
  (defvar emacs-config-dir (concat emacs-root-dir "/config"))
  (defvar emacs-extension-dir (concat emacs-root-dir "/extensions"))

  (with-temp-message ""                 ;抹掉插件启动的输出
    (require 'init-package)
    (require 'init-startup)
    (require 'init-theme)
    (require 'init-auto-save)
    (require 'init-ess)
    (require 'init-lisp)
    (require 'init-awesome-pair)
    (require 'init-magit)
    (require 'init-company)
    (require 'init-python)
    (require 'init-sdcv)
    (require 'init-utils)
    (require 'init-org)
    (require 'init-flycheck)
    (require 'init-eaf)
    (require 'init-c)
    (require 'init-color-rg)
    (require 'init-sql)
    (require 'init-web)
    (require 'init-go)
    (require 'init-lsp)
    (require 'init-rpc)
    (require 'init-buffer)
    (require 'init-awesome-tab)
    (require 'init-markdown)
    (require 'init-rust)
    (require 'init-tags)
    (require 'init-lua)
    (require 'init-emms)
    (require 'init-julia)))
(provide 'init)
