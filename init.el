(package-initialize)
(setq inhibit-startup-message t)

;;(add-to-list 'load-path (expand-file-name "package-init" user-emacs-directory))

(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

;; first load package init functionality ;;
(load-directory "~/.emacs.d/package-init")

;; Install packages
(defun install-my-packages ()
  (packages-install
   '(magit
     smex
     ido
     ido-vertical-mode
     haml-mode
     sass-mode
     org
     flymake-ruby
     projectile
     projectile-rails
     flymake
     flycheck
     rbenv
     js2-mode
     rjsx-mode
     )))


;; Refresh package contents in case of error
(condition-case nil
    (install-my-packages)
  (error
   (package-refresh-contents)
   (install-my-packages)))

;;------------------------------------------------------------------------------
;; Load all the settings
;;------------------------------------------------------------------------------
(load-directory "~/.emacs.d/settings")

(require 'setup-simple-settings)
(require 'setup-org)
(require 'setup-ido)
(require 'flymake-ruby)
(require 'haml-mode)
(require 'prettier-js)

;;------------------------------------------------------------------------------
;; settings
;;------------------------------------------------------------------------------
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(setq ruby-deep-indent-paren nil)

(set-frame-parameter nil 'fullscreen 'fullboth)

;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)

;;------------------------------------------------------------------------------
;; Keybindings
;;------------------------------------------------------------------------------
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x c r") 'comment-region)
(global-set-key (kbd "C-x c u") 'uncomment-region)
(global-set-key (kbd "M-x") 'smex)

;;------------------------------------------------------------------------------
;; Themes + mode line colors
;;------------------------------------------------------------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'spacemacs-light t)
;;(load-theme 'spacemacs-dark t)
;;(load-theme 'zenburn t)
(require 'moe-theme)
(moe-dark)
;;(moe-light)
(setq moe-theme-highlight-buffer-id t)
(moe-theme-set-color 'blue)
(powerline-moe-theme)

;;------------------------------------------------------------------------------
;; fun
;;------------------------------------------------------------------------------
(defun setup-windows ()
  "Organize a series of windows for distraction"
  (interactive)
  (delete-other-windows)

  ;; Start with the Stack Overflow interface
  (sx-tab-frontpage t nil)
  
  ;; Put IRC on the other side
  ;; (split-window-horizontally)
  ;; (other-window 1)
  ;; (circe-connect-all)

  (split-window-vertically)
  (elfeed)
  )
  
;;------------------------------------------------------------------------------
;; Emacs autosaved custom variables
;;------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "1373e3623ed5d758ef06dd19f2c8a736a69a15496c745a113d42230ab71d6b58" default)))
 '(elfeed-feeds
   (quote
    ("https://aws.amazon.com/new/feed/" "http://feeds.feedburner.com/PythonInsider" "https://www.ruby-lang.org/en/feeds/news.rss" "http://lithub.com/feed/" "http://lithub.com/")))
 '(js-indent-level 2)
 '(org-agenda-files (quote ("~/org/tasks.org" "~/org/notes.org")))
 '(package-selected-packages
   (quote
    (discover gh elfeed sx yaml-mode org-bullets prettier-js robe rjsx-mode js2-mode tuareg flycheck-ocaml go-mode flymake-ruby sass-mode haml-mode ido-vertical-mode yasnippet web-mode use-package smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell drag-stuff)))
 '(sx-default-site "stackoverflow"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
;;(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
