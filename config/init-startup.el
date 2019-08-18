(tool-bar-mode -1)                      ;禁用工具栏
(menu-bar-mode -1)                      ;禁用菜单栏
(scroll-bar-mode -1)                    ;禁用滚动条
(setq inhibit-startup-screen t)		;初始界面
(toggle-frame-fullscreen)
(show-paren-mode t)			;展示匹配括号
(setq make-backup-files nil)		;不要生成备份文件
(defalias 'yes-or-no-p 'y-or-n-p)	;y-or-n-p
(setq split-height-threshold 0)		;设置分屏高度阀值为nil
(setq split-width-threshold nil)	;设置分屏宽度为0
(add-hook 'text-mode-hook 'auto-fill-mode) ;段缩进
(setq-default fill-column 80)		   ;缩进列数
(global-linum-mode t)
(global-unset-key (kbd "C-x C-c"))	;close kill emacs
(global-set-key (kbd "C-x C-j") 'eval-print-last-sexp)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package disable-mouse
  :ensure t
  :hook (prog-mode . disable-mouse-mode))

(use-package all-the-icons
  :ensure t)

(provide 'init-startup)
