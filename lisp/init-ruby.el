(require 'flymake-easy)
(require 'flymake-ruby)
(require 'haml-mode)

(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))


(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'robe-mode)
;;(push 'company-robe company-backends)

(setq ruby-deep-indent-paren nil)
(setq inf-ruby-default-implementation "pry")

(projectile-rails-global-mode)

(require 'rbenv)
(global-rbenv-mode)

(provide 'init-ruby)
