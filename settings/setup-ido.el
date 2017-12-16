(require 'ido)

(ido-mode t)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-max-prospects 10)

(require 'ido-vertical-mode)

(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
		    :background nil
		    :foreground "purple")
(set-face-attribute 'ido-vertical-only-match-face nil
		    :background nil
		    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
		    :foreground nil)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'setup-ido)
