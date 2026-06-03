;;; init-warnings.el --- tame the noisy compile/warning buffers -*- lexical-binding: t -*-

;; Only show the *Warnings* buffer for real errors, not byte-compile noise.
(setq warning-minimum-level :error)

(provide 'init-warnings)
;;; init-warnings.el ends here
