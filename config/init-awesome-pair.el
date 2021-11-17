;; -*- lexical-binding: t; -*-

(use-package awesome-pair
  :after (init)
  :quelpa (awesome-pair :fetcher github :repo "manateelazycat/awesome-pair")
  :hook ((
           c-mode
	   c++-mode
	   java-mode
	   haskell-mode
	   emacs-lisp-mode
	   lisp-interaction-mode
	   lisp-mode
	   maxima-mode
	   ielm-mode
	   sh-mode
	   makefile-gmake-mode
	   php-mode
	   python-mode
	   js-mode
	   go-mode
	   qml-mode
	   jade-mode
	   css-mode
	   ruby-mode
	   coffee-mode
	   rust-mode
           rustic-mode
	   qmake-mode
	   lua-mode
	   swift-mode
	   minibuffer-inactive-mode
	   ess-r-mode
	   r-mode
	   pipenv-mode
           protobuf-mode
           typescript-mode
           conf-toml-mode
           json-mode
           kotlin-mode
           web-mode) . awesome-pair-mode)
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
