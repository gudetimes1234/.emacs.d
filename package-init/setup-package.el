(require 'package)

;; Add melpa to package repos
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))

(setq package-pinned-packages '())

(package-refresh-contents)

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defmacro !cons (car cdr)
  "Destructive: Set CDR to the cons of CAR and CDR."
  `(setq ,cdr (cons ,car ,cdr)))

(defmacro !cdr (list)
  "Destructive: Set LIST to the cdr of LIST."
  `(setq ,list (cdr ,list)))

(defmacro --each (list &rest body)
  "Anaphoric form of `-each'."
  (declare (debug (form body))
           (indent 1))
  (let ((l (make-symbol "list")))
    `(let ((,l ,list)
           (it-index 0))
       (while ,l
         (let ((it (car ,l)))
           ,@body)
         (setq it-index (1+ it-index))
         (!cdr ,l)))))

(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
  (delete-other-windows))

(provide 'setup-package)
