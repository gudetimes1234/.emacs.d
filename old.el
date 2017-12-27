;;(add-to-list 'load-path (expand-file-name "package-init" user-emacs-directory))

;; (defun load-directory (dir)
;;   (let ((load-it (lambda (f)
;; 		   (load-file (concat (file-name-as-directory dir) f)))
;; 		 ))
;;     (mapc load-it (directory-files dir nil "\\.el$"))))

;; first load package init functionality ;;
;;(load-directory "~/.emacs.d/package-init")

;; Install packages
;; (defun install-my-packages ()
;;   (packages-install
;;    '(magit
;;      smex
;;      ido
;;      ido-vertical-mode
;;      haml-mode
;;      sass-mode
;;      org
;;      flymake-ruby
;;      projectile
;;      projectile-rails
;;      flymake
;;      flycheck
;;      rbenv
;;      js2-mode
;;      rjsx-mode
;;      )))


;; Refresh package contents in case of error
;; (condition-case nil
;;     (install-my-packages)
;;   (error
;;    (package-refresh-contents)
;;    (install-my-packages)))

;;------------------------------------------------------------------------------
;; Load all the settings
;;------------------------------------------------------------------------------
;;(load-directory "~/.emacs.d/settings")
