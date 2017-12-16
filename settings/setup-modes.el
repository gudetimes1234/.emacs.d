;; Ruby
;;--------------------------------------------------------------------
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(setq ruby-deep-indent-paren nil)

(require 'haml-mode)

;;--------------------------------------------------------------------

(require 'prettier-js)

;;--------------------------------------------------------------------
;;(add-to-list 'load-path 
;;(require 'sublimity-attractive)
;;
;;(sublimity-mode 1)

(provide 'setup-modes)