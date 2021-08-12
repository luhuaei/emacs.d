;; -*- lexical-binding: t; -*-

(use-package emms
  :after (ivy)
  :quelpa (emms :fetcher git :url "https://git.savannah.gnu.org/git/emms.git")
  :bind (("C-x m r" . 'emms-random)
         ("C-x m s" . 'emms-start)
         ("C-x m c" . 'emms-stop)
         ("C-x m n" . 'emms-next)
         ("C-x m p" . 'emms-previous)
         ("C-x m d" . 'emms-show)
         ("C-x m a" . 'emms-show-all)
         ("C-x m t l" . 'emms-toggle-repeat-playlist)
         ("C-x m t s" . 'emms-toggle-repeat-track)
         ("C-x m t r" . 'emms-toggle-random-playlist))
  :config
  (require 'emms-setup)
  (emms-minimalistic)
  (emms-toggle-repeat-playlist)

  (setq emms-player-list '(emms-player-mpv)
        emms-playlist-buffer-name "*Music*"
        emms-info-asynchronously t
        emms-source-file-default-directory "~/Music/")
  (emms-add-directory-tree emms-source-file-default-directory)

  (add-to-list 'emms-player-mpv-parameters "--vo=null")
  (add-to-list 'emms-player-mpv-parameters "--no-config"))

(provide 'init-emms)
