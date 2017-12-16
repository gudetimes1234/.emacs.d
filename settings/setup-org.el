;; (defun myorg-update-parent-cookie ()
;;   (when (equal major-mode 'org-mode)
;;     (save-excursion
;;       (ignore-errors
;; 	(org-back-to-heading)
;; 	(org-update-parent-todo-statistics)))))

;; (defadvice org-kill-line (after fix-cookie activate)
;;   (myorg-update-parent-cookie))

;; (defadvice kill-whole-line (after fix-cookies activate)
;;   (myorg-update-parent-cookie))

;;(setq org-directory "~/org")
;;(setq org-default-notes-file (concat org-directory "/notes.org"))
;;(define-key global-map (kbd "M-#") 'org-capture)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;; 	(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;; 	(sequence "|" "CANCELED(c)")))
(setq org-todo-keywords
       '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'setup-org)
