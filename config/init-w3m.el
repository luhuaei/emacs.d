(use-package w3m
  :ensure t
  :bind (("C-c C-w s" . w3m-search)
	 ("C-c C-w o" . w3m-browse-url)
	 ("C-c C-w v" . w3m-bookmark-view))
  :config
  ;; 常规设置
  (setq browse-url-browser-function 'w3m-browse-url) ;设定用Emacs－wiki打开URL
  (setq browse-url-new-window-flag t)		     ;用适当的浏览器打开新窗口
  (setq w3m-search-default-engine "duckduckgo")	     ;设置默认搜索引擎
  (setq w3m-make-new-session t)	       ;当浏览一个新的页面时开启一个新的缓存页面
  (setq w3m-use-cookies t)	       ;启用cookie
  (setq w3m-use-header-line-title nil) ;不显示显示标题
  (setq w3m-cookie-accept-bad-cookies t)	       ;接收 BAD cookie
  (setq w3m-view-this-url-new-session-in-background t) ;后台打开连接
  (setq w3m-new-session-in-background t)	       ;后台建立新任务
  (setq w3m-session-time-format "%Y-%m-%d %A %H:%M") ;上次浏览记录的时间显示格式
  (setq w3m-favicon-use-cache-file t)		     ;使用网站图标的缓存文件
  (setq w3m-show-graphic-icons-in-mode-line nil)     ;不在mode-line显示网站图标
  (setq w3m-keep-arrived-urls 50000)		     ;浏览历史记录的最大值
  (setq w3m-keep-cache-size 1000)		     ;缓存的大小
  (setq w3m-edit-function (quote find-file-other-window)) ;在其他窗口编辑当前页面
  (setq w3m-session-automatic-save t)                     ;退出时自动保存
  (setq w3m-session-deleted-save nil)                     ;关闭一个标签时不保存
  (setq w3m-default-display-inline-images nil)	;默认不显示网页中的图像
  (setq w3m-toggle-inline-images-permanently t)	;继续保持当前buffer的图像状态
  (setq w3m-use-filter t)			;开启过滤
  (setq w3m-filter-google-separator "")		;设置过滤器的分离字符
  (setq w3m-fb-mode t)				;让标签和创建它的FRAME关联
  (setq w3m-session-load-crashed-sessions t)	;默认加载崩溃的对话
  (w3m-fb-mode 1)				;可以显示FRAME
  (setq w3m-use-tab nil)			;close web tab
  (setq w3m-use-header-line nil)		;头部状态栏不要
  )
(provide 'init-w3m)
