(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require 'flymake-easy)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; provides `auto-complete` source for use in `inf-ruby-mode` buffers
(require 'ac-inf-ruby)
(eval-after-load 'auto-complete
		 '(add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

(add-hook 'compilation-finish-functions
	  (lambda (buf strg)
	    (swith-to-buffer-other-window "*compilation*")
	    (read-only-mode)
	    (goto-char (point-max))
	    (local-set-key (kdb "q")
			   (lambda () (interactive) (quit-restore-window)))))

(require 'minitest)
(add-hook 'ruby-mode-hook 'minitest-mode)

;; robe
;; ------------------------------------------------------------------------
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(require 'company)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
(add-hook 'ruby-mode-hook 'company-mode)
(push 'company-robe company-backends)

(add-hook 'robe-mode-hook 'ac-robe-setup)

(setq ruby-deep-indent-paren nil)
(setq inf-ruby-default-implementation "pry")


;; projectile
;; ------------------------------------------------------------------------
(projectile-rails-global-mode)


;; rbenv
;; ------------------------------------------------------------------------
(require 'rbenv)
(global-rbenv-mode)
(rbenv-use-global)


;; syntax things
;; ------------------------------------------------------------------------
(require 'haml-mode)

(require 'ruby-electric) ;; Minor mode for electrically editing ruby code
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'ruby-block)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'ruby-extra-highlight)
(add-hook 'ruby-mode-hook 'ruby-extra-highlight-mode)

(provide 'init-ruby)
