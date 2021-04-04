;; -*- lexical-binding: t; -*-

(tool-bar-mode -1)                                     ;禁用工具栏
(menu-bar-mode -1)                                     ;禁用菜单栏
(scroll-bar-mode -1)                                   ;禁用滚动条
(setq inhibit-startup-screen t)                        ;初始界面
(toggle-frame-fullscreen)                              ;全屏
(show-paren-mode t)                                    ;展示匹配括号
(setq make-backup-files nil)                           ;不要生成备份文件
(setq create-lockfiles nil)                            ;不要生产.#filename
(defalias 'yes-or-no-p 'y-or-n-p)                      ;y-or-n-p
(setq split-height-threshold 0)                        ;设置分屏高度阀值为nil
(setq split-width-threshold nil)                       ;设置分屏宽度为0
;; (add-hook 'text-mode-hook 'auto-fill-mode)          ;段缩进
(setq-default fill-column 80)                          ;缩进列数
(global-display-line-numbers-mode t)
(global-set-key (kbd "C-x C-j") 'eval-print-last-sexp) ;求值
(global-set-key (kbd "C-x k") 'kill-current-buffer)    ;关闭buffer
(global-hl-line-mode t)                                ;高亮行
(column-number-mode t)                                 ;在modeline显示行数
(electric-indent-mode t)
(global-set-key (kbd "M-s r") 'replace-regexp)         ;替换
(setq-default indent-tabs-mode nil)                    ;使用空格代替tab键
(global-display-fill-column-indicator-mode -1)

;; C-a to the first char not whitespacee
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)))

;; go to the last change
(use-package goto-last-change
  :bind (("C-:" . goto-last-change)))

;; mode line
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
	;; mode-line-modes
	;; mode-line-misc-info

	(:eval (format "%s" last-command))))
;; (setq-default mode-line-format nil)

;; custom function
(defun my/mode-line-modify ()
  "设置没有激活的窗口mode-line为underline"
  (set-face-attribute 'mode-line-inactive nil
		      :underline '(:color "DarkRed")
		      :height 0.1
		      :background (face-background 'default)))
;; (add-hook 'after-init-hook #'my/mode-line-modify)

;; 跳转到scratch buffer
(defun my/scratch ()
  (interactive)
  (if (get-buffer "*scratch*")
      nil
    (startup--get-buffer-create-scratch))
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "<f9>") 'my/scratch)

;; 插入当前的时间
(defun my/insert-current-data ()
  (interactive)
  (insert (format-time-string "[%Y-%m-%d %H:%M:%S]")))

(global-set-key (kbd "C-{") 'awesome-pair-open-round)
(global-set-key (kbd "C-}") 'awesome-pair-wrap-round)

;; 鼠标自动移动到右下角
;; mouse auto move to right bottom
;; (setq mouse-avoidance-banish-position '((frame-or-window . frame)
;; 					(side . right)
;; 					(side-pos . 3)
;; 					(top-or-bottom . bottom)
;; 					(top-or-bottom-pos . 0)))
;; (mouse-avoidance-mode 'banish)

(provide 'init-startup)
