
;;; requires and setup

(require 'pulse)
(require 'nav-flash)


;;; nav-flash-use-pulse-p

(ert-deftest nav-flash-use-pulse-p nil
  (let ((nav-flash-use-pulse nil))
    (should-not
     (nav-flash-use-pulse-p))))


;;; nav-flash-show

(ert-deftest nav-flash-show-01 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse nil))
     (read-char "Press a key to generate a nav-flash on line 4.")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (insert "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n")
     (goto-char (point-min))
     (forward-line 3)
     (nav-flash-show)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest nav-flash-show-02 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse nil))
     (read-char "Press a key to generate a nav-flash on line 5.")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (nav-flash-show 9)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest nav-flash-show-03 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse nil))
     (read-char "Press a key to generate a nav-flash on just the character \"5\".")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (nav-flash-show 9 9)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest nav-flash-show-04 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse nil))
     (read-char "Press a key to generate a nav-flash on lines 2 through 3.")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (nav-flash-show 3 7)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest nav-flash-show-05 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse nil))
     (read-char "Press a key to generate a nav-flash in a foreground face.")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (forward-line 3)
     (nav-flash-show nil nil 'font-lock-warning-face)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest nav-flash-show-06 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse nil))
     (read-char "Press a key to generate a nav-flash which lasts longer.")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (forward-line 3)
     (nav-flash-show nil nil nil 2)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest nav-flash-show-07 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t)
         (nav-flash-use-pulse t))
     (read-char "Press a key to generate a nav-flash which uses pulse.el to fade out.")
     (pop-to-buffer "*scratch*")
     (goto-char (point-min))
     (forward-line 3)
     (nav-flash-show)
     (y-or-n-p "Did that work as expected?"))))


;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; mangle-whitespace: t
;; require-final-newline: t
;; coding: utf-8
;; byte-compile-warnings: (not cl-functions)
;; End:
;;

;;; nav-flash-test.el ends here
