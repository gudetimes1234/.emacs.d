(global-linum-mode t)

(setq backup-directory-alist '(("." . "~/.saves")))
(global-linum-mode t)
(show-paren-mode t)

;; smex: a smart M-x enhancement
(require 'smex)
(smex-initialize)

(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)

(display-time-mode t)

(when (not (window-system))
  (xterm-mouse-mode +1))

;; show line and column numbers in modeline
(line-number-mode 1)
(column-number-mode 1)

(provide 'init-defaults)
