(defun setup-writegood-mode ()
  (interactive)
  (add-to-list 'load-path "lib/writegood-mode")
  (require 'writegood-mode)
  (global-set-key (kbd "C-c g") 'writegood-mode)
  (global-set-key (kbd "C-c C-v") 'writegood-reading-ease))


(defun setup-windows ()
  "Organize a series of windows for distraction"
  (interactive)
  (delete-other-windows)

  ;; Start with the Stack Overflow interface
  (sx-tab-frontpage t nil)
  
  ;; Put IRC on the other side
  ;; (split-window-horizontally)
  ;; (other-window 1)
  ;; (circe-connect-all)

  (split-window-vertically)
  (elfeed))

(provide 'init-custom-defuns)
