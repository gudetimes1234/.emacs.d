(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/lib" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "elpa" user-emacs-directory))

(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))

(eval-when-compile
  (package-install 'use-package)
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package init-git :ensure nil)
(use-package init-org :ensure nil)
(use-package init-ido :ensure nil)
(use-package init-ruby :ensure nil)
(use-package init-js :ensure nil)
(use-package cider :ensure nil)
(use-package init-elm :ensure nil)

(use-package init-defaults :ensure nil)
(use-package init-keybindings :ensure nil)
(use-package init-themes :ensure nil)
(use-package init-custom-defuns :ensure nil)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(provide 'init)
