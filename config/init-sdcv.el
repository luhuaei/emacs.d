;; -*- lexical-binding: t; -*-
(use-package sdcv
  :ensure nil
  :quelpa (sdcv :fetcher github :repo "manateelazycat/sdcv")
  :bind (("C-c p" . 'sdcv-search-pointer+)
	 ("C-c s" . 'sdcv-search-input+))
  :config
  (setq sdcv-say-word-p t)               ;say word after translation

  (setq sdcv-dictionary-data-dir (expand-file-name "~/emacs.d/sdcv-dict/")) ;setup directory of stardict dictionary

  (setq sdcv-dictionary-simple-list    ;setup dictionary list for simple search
	'("朗道汉英字典5.0"
	  "朗道英汉字典5.0"))

  (setq sdcv-dictionary-complete-list     ;setup dictionary list for complete search
	'(
	  "朗道汉英字典5.0"
	  "朗道英汉字典5.0"
	  )))
(provide 'init-sdcv)
