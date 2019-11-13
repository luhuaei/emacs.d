(tool-bar-mode -1)                      ;禁用工具栏
(menu-bar-mode -1)                      ;禁用菜单栏
(scroll-bar-mode -1)                    ;禁用滚动条
(setq inhibit-startup-screen t)		;初始界面
;; (toggle-frame-fullscreen)
(show-paren-mode t)			;展示匹配括号
(setq make-backup-files nil)		;不要生成备份文件
(defalias 'yes-or-no-p 'y-or-n-p)	;y-or-n-p
(setq split-height-threshold 0)		;设置分屏高度阀值为nil
(setq split-width-threshold nil)	;设置分屏宽度为0
(add-hook 'text-mode-hook 'auto-fill-mode) ;段缩进
(setq-default fill-column 80)		   ;缩进列数
(global-linum-mode -1)
(global-unset-key (kbd "C-x C-c"))	;close kill emacs
(global-set-key (kbd "C-x C-j") 'eval-print-last-sexp)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
;; (global-hl-line-mode -1)
(column-number-mode t)
(global-set-key (kbd "M-s r") 'replace-regexp)

(setq-default mode-line-format
      '("%e"
	mode-line-front-space
	mode-line-mule-info
	mode-line-client
	mode-line-modified
	mode-line-remote
	mode-line-frame-identification
	mode-line-buffer-identification
	"   "
	mode-line-position
	(vc-mode vc-mode)
	"   "
	mode-line-modes
	mode-line-misc-info
	(:eval (format "%s" last-command))))

(defun my-mode-line-modify ()
  "设置没有激活的窗口mode-line为underline"
  (set-face-attribute 'mode-line-inactive nil
		      :underline '(:color "DarkRed")
		      :height 0.1
		      :background (face-background 'default)))
(add-hook 'after-init-hook #'my-mode-line-modify)

;; mouse auto move the right bottom
(mouse-avoidance-mode 'banish)
(setq mouse-avoidance-banish-position '((frame-or-window . frame)
					(side . right)
					(side-pos . 3)
					(top-or-bottom . bottom)
					(top-or-bottom-pos . 0)))

(defun my-scratch ()
  (interactive)
  (if (get-buffer "*scratch*")
      nil
    (startup--get-buffer-create-scratch))
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "<f9>") 'my-scratch)

(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "[%Y-%m-%d %H:%M:%S]")))

(use-package diminish
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package disable-mouse
  :ensure t
  :disabled
  :diminish disable-mouse-global-mode
  :hook (after-init . global-disable-mouse-mode))

(use-package all-the-icons
  :ensure t)

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 30)
   (auto-package-update-maybe))

(provide 'init-startup)
