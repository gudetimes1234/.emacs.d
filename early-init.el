;;; early-init.el --- runs before package.el and the GUI -*- lexical-binding: t -*-

;; Native-comp must be silenced here; by the time init.el runs, the
;; async compiler is already going.
(setq native-comp-async-report-warnings-errors 'silent)

;;; early-init.el ends here
