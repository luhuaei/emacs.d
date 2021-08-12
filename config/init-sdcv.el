;; -*- lexical-binding: t; -*-
(use-package posframe
  :defer t
  :quelpa (posframe :fetcher github :repo "tumashu/posframe"))

(use-package sdcv
  :after t
  :quelpa (sdcv :fetcher github :repo "manateelazycat/sdcv")
  :config
  (setq sdcv-say-word-p nil)               ;say word after translation

  (if (display-graphic-p)
      (progn
        (bind-key "C-c p" 'sdcv-search-pointer+)
        (bind-key "C-c s" 'sdcv-search-input+))
    (bind-key "C-c p" 'sdcv-search-pointer)
    (bind-key "C-c s" 'sdcv-search-input))

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
