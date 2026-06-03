;;; init-ui.el --- UI, fonts, theme, and quality-of-life defaults -*- lexical-binding: t -*-

;; Quiet startup.
(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function 'ignore)
(when (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Sensible defaults.
(setq-default tab-width 4 indent-tabs-mode nil)
(column-number-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(electric-pair-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(global-auto-revert-mode 1)
(defalias 'yes-or-no-p #'y-or-n-p)

;; Theme: Catppuccin Mocha.
(use-package catppuccin-theme
  :init (setq catppuccin-flavor 'mocha)
  :config (load-theme 'catppuccin t))

;; Font with graceful fallback.
(let ((font (cond ((find-font (font-spec :name "JetBrains Mono")) "JetBrains Mono")
                  ((find-font (font-spec :name "JetBrainsMono Nerd Font")) "JetBrainsMono Nerd Font")
                  ((find-font (font-spec :name "Monospace")) "Monospace"))))
  (when font (set-face-attribute 'default nil :family font :height 120)))

;; Discoverability + minibuffer completion.
(use-package which-key :config (which-key-mode 1))

;; Vertico + consult for a modern minibuffer with live previews.
(use-package vertico :init (vertico-mode 1))
(use-package marginalia :init (marginalia-mode 1))
(use-package orderless
  :init (setq completion-styles '(orderless basic)
              completion-category-defaults nil))
(use-package consult
  :bind (("M-y" . consult-yank-pop)
         ("C-x b" . consult-buffer)
         ("M-g g" . consult-goto-line)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)))

;; More themes to pick from.
(use-package doom-themes)
(use-package ef-themes)

(provide 'init-ui)
;;; init-ui.el ends here
