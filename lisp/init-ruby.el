(require 'haml-mode)

(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require 'flymake-easy)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(push 'company-robe company-backends)

(add-hook 'robe-mode-hook 'ac-robe-setup)

(setq ruby-deep-indent-paren nil)
;;(setq inf-ruby-default-implementation "pry")

(projectile-rails-global-mode)

(require 'rbenv)
(global-rbenv-mode)

;; provides `auto-complete` source for use in `inf-ruby-mode` buffers
(require 'ac-inf-ruby)
(eval-after-load 'auto-complete
		 '(add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

(provide 'init-ruby)
