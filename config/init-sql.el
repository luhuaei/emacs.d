(use-package sql-indent
  :ensure nil
  :quelpa (sql-indent :fetcher github :repo "alex-hhh/emacs-sql-indent")
  :hook (sql-mode . sqlind-minor-mode))

(provide 'init-sql)
