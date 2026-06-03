;;; init.el --- thin bootstrap; real config lives in config/  -*- lexical-binding: t -*-

;; Stash backups + autosaves out of the working tree.
(let ((bk (expand-file-name "backups/"   user-emacs-directory))
      (as (expand-file-name "auto-save/" user-emacs-directory)))
  (make-directory bk t) (make-directory as t)
  (setq backup-directory-alist        `(("." . ,bk))
        auto-save-file-name-transforms `((".*" ,as t))))

;; Keep init.el clean — customize writes to its own file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;;; ──── Package bootstrap ───────────────────────────────────────────────
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;; ──── Modular config under ./config ───────────────────────────────────
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(require 'init-warnings)
(require 'init-ui)

;;; ──── nyan cat mode dud ───────────────────────────────────────────────

;;; ──── Markdown writing setup ──────────────────────────────────────────
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :config
  ;; Hide formatting markup tags (**, #, _) unless editing that exact line
  (setq markdown-hide-markup t)
  (setq markdown-hide-urls t)
  (setq markdown-header-scaling t)               ; Dynamic header sizing
  (setq markdown-fontify-code-blocks-natively t) ; Syntax-highlight code blocks
  :hook
  ((markdown-mode . visual-line-mode)            ; Soft word wrapping at borders
   (markdown-mode . olivetti-mode)               ; Center text document canvas
   (markdown-mode . (lambda () (setq-local line-spacing 0.35))))) ; Breatheable padding

;; Automatically centers the page like a premium Mac writing application
(use-package olivetti
  :ensure t
  :config
  (setq olivetti-body-width 82))

;; Keeps tables & code blocks aligned in monospaced font, while prose looks pretty
(use-package mixed-pitch
  :ensure t
  :hook (markdown-mode . mixed-pitch-mode))

;; Configures your main text reading font (Clean, modern proportional font)
(set-face-attribute 'variable-pitch nil 
                    :font "Open Sans" 
                    :height 135 
                    :weight 'regular)

;; Configures your code block / alignment font (Perfect monospaced grid)
(set-face-attribute 'fixed-pitch nil 
                    :font "Noto Sans Mono" 
                    :height 120)

;; -----------------------------------------------------------------------------
;; MAGAZINE-STYLE UI SCALING AND HEADER COSMETICS
;; -----------------------------------------------------------------------------
(custom-theme-set-faces
 'user
 `(markdown-header-face-1 ((t (:inherit outline-1 :height 1.6 :weight bold :foreground "#2c3e50"))))
 `(markdown-header-face-2 ((t (:inherit outline-2 :height 1.35 :weight bold :foreground "#34495e"))))
 `(markdown-header-face-3 ((t (:inherit outline-3 :height 1.18 :weight bold :foreground "#7f8c8d"))))
 `(markdown-code-face ((t (:inherit fixed-pitch :background "#f8f9fa"))))
 `(markdown-inline-code-face ((t (:inherit fixed-pitch :foreground "#e74c3c" :background "#f8f9fa")))))

;;; ──── Claude Gravity (emacs-bridge plugin) ───────────────────────────
(add-to-list 'load-path "/home/charlesgude/.claude/plugins/marketplaces/emacs-gravity-marketplace")
(require 'claude-gravity)
(claude-gravity-server-start)

;;; ──── idk where to put `add-hook' calls for dired stuff so im throwin' it here i don't fucking care
(setq dired-hide-details-hide-symlink-targets nil)
(setenv "LC_COLLATE" "C")
(setq dired-listing-switches "-GFhl --group-directories-first")
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-mode))



;;; init.el ends here
