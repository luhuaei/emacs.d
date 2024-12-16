;; -*- lexical-binding: t; -*-


(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(tool-bar-mode -1)                                     ;禁用工具栏
(menu-bar-mode -1)                                     ;禁用菜单栏
(scroll-bar-mode -1)                                   ;禁用滚动条
(global-display-fill-column-indicator-mode -1)
(toggle-frame-fullscreen)                              ;全屏

(setq inhibit-startup-screen t)                        ;初始界面
(setq make-backup-files nil)                           ;不要生成备份文件
(setq create-lockfiles nil)                            ;不要生产.#filename
(defalias 'yes-or-no-p 'y-or-n-p)                      ;y-or-n-p
(setq split-height-threshold 0)                        ;设置分屏高度阀值为nil
(setq split-width-threshold nil)                       ;设置分屏宽度为0
(setq-default fill-column 80)                          ;缩进列数
(global-set-key (kbd "C-x C-j") 'eval-print-last-sexp) ;求值
(global-set-key (kbd "C-x k") 'kill-current-buffer)    ;关闭buffer
(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x C-c") 'restart-emacs)
(global-set-key (kbd "M-s r") 'replace-regexp)         ;替换
(setq native-comp-async-report-warnings-errors nil)

(add-hook 'after-init-hook
	  (lambda ()
	    (global-hl-line-mode t)                                ;高亮行
	    (column-number-mode t)                                 ;在modeline显示行数
	    (electric-indent-mode t)
	    (setq-default indent-tabs-mode nil)                    ;使用空格代替tab键
	    (show-paren-mode t)                                    ;展示匹配括号)
	    ))

(defun count-chinese-characters (&optional begin end)
  "Count Chinese characters in the region or whole buffer."
  (interactive "r")
  (let ((begin (or begin (point-min)))
        (end (or end (point-max))))
    (save-excursion
      (let ((cnt 0))
        (goto-char begin)
        (while (< (point) end)
          (if (and (> (following-char) #x4e00)
                   (< (following-char) #x9fff))
              (setq cnt (1+ cnt)))
          (forward-char 1))
        (message "汉字数量: %d" cnt)))))

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
		(:eval (format "%s" last-command))))

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
  (insert (format-time-string "%Y-%m-%d %H:%M:%S +08:00")))



(provide 'init-startup)
