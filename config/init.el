;; -*- lexical-binding: t; -*-

;; benchmark init
(require 'benchmark-init-loaddefs)
(benchmark-init/activate)

(require 'benchmark-init)
(add-hook 'after-init-hook 'benchmark-init/deactivate)

;; fonts
(when (display-graphic-p)
  (set-face-attribute
   'default nil
   :font (font-spec :name "WenQuanYi Micro Hei Mono"
                    :weight 'normal
                    :slant 'normal
                    :size 18.0)))

(defun my--merged-environment (process-env pairs)
  (append (mapcar (lambda (pair)
                    (if (cdr pair)
                        (format "%s=%s" (car pair) (cdr pair))
                      ;; Plain env name is the syntax for unsetting vars
                      (car pair)))
                  pairs)
          process-env))

(defun my--direnv-export (emacs-config-dir)
  (let ((default-directory emacs-config-dir)
         (tempfile (make-temp-file "drienv-stderr"))
         result)
    (with-temp-buffer
      (let ((exit-code (call-process "direnv" nil (list t tempfile) nil "export" "json")))
        (if (zerop exit-code)
            (progn
              (goto-char (point-min))
              (setq result (let ((json-key-type 'string))
                             (json-read-object))))
          (error "Load direnv failed."))))
    (delete-file tempfile)
    result))

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  ;; 定义一些启动目录，方便下次迁移修改
  (defvar emacs-root-dir (file-truename "~/emacs.d"))
  (defvar emacs-config-dir (concat emacs-root-dir "/config"))
  (defvar emacs-extension-dir (concat emacs-root-dir "/extensions"))

  (if (file-exists-p (expand-file-name ".envrc" emacs-config-dir))
      (setq-default process-environment (my--merged-environment process-environment (my--direnv-export emacs-config-dir))))

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
    (require 'init-markdown)
    (require 'init-rust)
    (require 'init-tags)
    (require 'init-lua)
    (require 'init-emms)
    (require 'init-julia)
    (require 'init-nix)
    (require 'init-tex)))
(provide 'init)
