;;; namer.el simulates and tests an e-LISP Name type.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Charles Blum
;;; Date: 13 April 2014
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load the Name module                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path  ".")
("." "/usr/share/emacs23/site-lisp/dictionaries-common" "/etc/emacs23" "/etc/emacs" "/usr/local/share/emacs/23.3/site-lisp" "/usr/local/share/emacs/site-lisp" "/usr/share/emacs/23.3/site-lisp" "/usr/share/emacs/23.3/site-lisp/dictionaries-common" "/usr/share/emacs/site-lisp" "/usr/share/emacs/23.3/leim" "/usr/share/emacs/23.3/lisp" "/usr/share/emacs/23.3/lisp/url" ...)

(load "Name.elc")
t


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; Common Lisp's assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name

  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))

  (setq buf (get-buffer "namer.el"))         ; buf = this buffer
  (assert (eq (printName aName buf) aName) )
  (terpri buf)                               ; newline
  (princ "All tests passed!")                ; feedback
  (terpri buf))                              ; newline

John Paul Jones
All tests passed!
t
