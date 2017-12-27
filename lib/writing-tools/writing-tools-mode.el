;;; writing-tools-mode.el --- Apply common best-practice rules to your writing
;;
;; Author: Charles Gude
;; Created: 2017-12-20
;; Version: 0.0
;; Last-Updated: 2017-12-20
;; URL: none
;; Keywords: writing tools best-practice
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  This minor mode tries to find and highlight problems with your
;;  writing (in english).
;;
;;  Behavior inspired by the weaselwords scripts to aid in good
;;  writing.
;;  http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(eval-when-compile
  (require 'cl))

(defgroup writing-tools nil
  "Minor mode for highlighting rules broken."
  :prefix "writing-tools-"
  :group 'help
  :link '(url-link "http://www.example.com"))

(defconst writing-tools-version "0.0"
  "Writing Tools mode version")

;; Passive voice

;; Weasel words
