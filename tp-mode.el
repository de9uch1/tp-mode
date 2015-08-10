;;; tp-mode.el --- Transparent for GNU Emacs

;; Copyright (C) 2015 Hiroyuki Deguchi

;; Author: Hiroyuki Deguchi <lambda@dg-che.net>
;; URL: https://github.com/dg-che/tp-mode
;; Version: 0.1
;; License: GPL-3

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>

;;; Commentary:
;;
;; init.el:
;; (require 'tp-mode)
;; (tp-mode <alpha>)
;; 
;; Toggle:
;; M-x tp-mode
;;

;;; Code:



(defcustom tp-mode nil
  "Default is off")
(defcustom tp-mode-alpha 90
  "alpha value")

(unless (assq 'tp-mode minor-mode-alist)
  (setq minor-mode-alist
        (cons '(tp-mode "")
              minor-mode-alist)))

(defun tp-mode (&optional arg)
  "Transparent minor-mode"
  (interactive)
  (cond ((and (numberp arg) (= arg 100))
         (set-frame-parameter nil 'alpha arg)
         (setq tp-mode nil))
        (arg (set-frame-parameter nil 'alpha arg)
             (setq tp-mode 't))
        (tp-mode (set-frame-parameter nil 'alpha 100)
                 (setq tp-mode nil))
        (t (set-frame-parameter nil 'alpha tp-mode-alpha)
           (setq tp-mode 't))
        )
  )

(provide 'tp-mode)
;;; tp-mode.el ends here
