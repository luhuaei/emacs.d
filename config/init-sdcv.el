;; -*- lexical-binding: t; -*-
(use-package posframe
  :defer t
  :quelpa (posframe :fetcher github :repo "tumashu/posframe"))

(use-package sdcv
  :after (init)
  :quelpa (sdcv :fetcher github :repo "manateelazycat/sdcv")
  :config
  (setq sdcv-say-word-p nil)               ;say word after translation

  (if (display-graphic-p)
      (progn
        (bind-key "C-c p" 'sdcv-search-pointer+)
        (bind-key "C-c s" 'sdcv-search-input+))
    (bind-key "C-c p" 'sdcv-search-pointer)
    (bind-key "C-c s" 'sdcv-search-input))

  (setq sdcv-dictionary-data-dir (expand-file-name "~/emacs.d/sdcv-dict/")) ;setup directory of stardict dictionary  )
  )
(provide 'init-sdcv)
