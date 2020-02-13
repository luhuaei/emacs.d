(use-package awesome-pair
  :ensure nil
  :quelpa (awesome-pair :fetcher github :repo "manateelazycat/awesome-pair")
  :hook (awesome-pair-mode . '(
		 'c-mode-common-hook
		 'c-mode-hook
		 'c++-mode-hook
		 'java-mode-hook
		 'haskell-mode-hook
		 'emacs-lisp-mode-hook
		 'lisp-interaction-mode-hook
		 'lisp-mode-hook
		 'maxima-mode-hook
		 'ielm-mode-hook
		 'sh-mode-hook
		 'makefile-gmake-mode-hook
		 'php-mode-hook
		 'python-mode-hook
		 'js-mode-hook
		 'go-mode-hook
		 'qml-mode-hook
		 'jade-mode-hook
		 'css-mode-hook
		 'ruby-mode-hook
		 'coffee-mode-hook
		 'rust-mode-hook
		 'qmake-mode-hook
		 'lua-mode-hook
		 'swift-mode-hook
		 'minibuffer-inactive-mode-hook
		 'ess-r-mode-hook
		 'r-mode-hook
		 'pipenv-mode-hook
                 'web-mode-hook
		 ))
  :bind (:map awesome-pair-mode-map
              ("(" . 'awesome-pair-open-round)
              (")" . 'awesome-pair-close-round)
              ("[" . 'awesome-pair-open-bracket)
              ("]" . 'awesome-pair-close-bracket)
              ("{" . 'awesome-pair-open-curly)
              ("}" . 'awesome-pair-close-curly)
              ("=" . 'awesome-pair-equal)
              ("%" . 'awesome-pair-match-paren)
              ("\"" . 'awesome-pair-double-quote)
              ("SPC" . 'awesome-pair-space)
              ("M-o" . 'awesome-pair-backward-delete)
              ("C-d" . 'awesome-pair-forward-delete)
              ("C-k" . 'awesome-pair-kill)
              ("M-\"" . 'awesome-pair-wrap-bracket)
              ("M-[" . 'awesome-pair-wrap-curly)
              ("M-{" . 'awesome-pair-wrap-curly)
              ("M-(" . 'awesome-pair-wrap-round)
              ("M-)" . 'awesome-pair-unwrap)
              ("M-p" . 'awesome-pair-jump-right)
              ("M-n" . 'awesome-pair-jump-left)
              ("M-:" . 'awesome-pair-jump-out-pair-and-newline))
  )
(provide 'init-awesome-pair)
