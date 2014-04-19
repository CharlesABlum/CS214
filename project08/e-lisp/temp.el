;;; temp.el simulates and tests an e-LISP 
;;; Temperature type.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Charles Blum
;;; Date: 18 April 2014
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load the Temperature module             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path  ".")
("." "/usr/share/emacs23/site-lisp/dictionaries-common" "/etc/emacs23" "/etc/emacs" "/usr/local/share/emacs/23.3/site-lisp" "/usr/local/share/emacs/site-lisp" "/usr/share/emacs/23.3/site-lisp" "/usr/share/emacs/23.3/site-lisp/dictionaries-common" "/usr/share/emacs/site-lisp" "/usr/share/emacs/23.3/leim" "/usr/share/emacs/23.3/lisp" "/usr/share/emacs/23.3/lisp/url" ...)

(load "Temperature.elc")
t

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; test the Temperature module             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun runTests(buf) 
  ;(require 'cl)
  (setq temp (Temperature 30 ?C))

  ;;Getters
  (assert (= (getValue temp) 30.00))
  (assert (char-equal (getUnit temp)  ?C))

  ;Setters
  (setValue temp -100.00)
  (setUnit temp ?F)
  (assert (= (getValue temp) -100.00))
  (assert (char-equal (getUnit temp) ?F))

  ;;Test Conversions
  ;;This runs through each conversion without repetition
  (princ "Testing Conversions..." buf) (terpri buf)
  (toC temp)
  (assert (= (getValue temp) -73.33))
  (assert (char-equal (getUnit temp) ?C))
  (toR temp)
  (assert (= (getValue temp) 359.68))
  (assert (char-equal (getUnit temp) ?R))
  (toK temp)
  (assert (= (getValue temp) 199.82))
  (assert (char-equal (getUnit temp) ?K))
  (toF temp)
  (assert (= (getValue temp) -99.99))
  (assert (char-equal (getUnit temp) ?F))

  (princ "Pass 1 Complete!" buf) (terpri buf)

  (toR temp)
  (assert (= (getValue temp) 359.68))
  (assert (char-equal (getUnit temp) ?R))
  (toC temp)
  (assert (= (getValue temp) -73.33))
  (assert (char-equal (getUnit temp) ?C))
  (toK temp)
  (assert (= (getValue temp) 199.82))
  (assert (char-equal (getUnit temp) ?K))
  (toR temp)
  (assert (= (getValue temp) 359.68))
  (assert (char-equal (getUnit temp) ?R))

  (princ "Pass 2 Complete!" buf) (terpri buf)

  (toF temp)
  (assert (= (getValue temp) -99.99))
  (assert (char-equal (getUnit temp) ?F))
  (toK temp)
  (assert (= (getValue temp) 199.82))
  (assert (char-equal (getUnit temp) ?K))
  (toC temp)
  (assert (= (getValue temp) -73.33))
  (assert (char-equal (getUnit temp) ?C))
  (toF temp)
  (assert (= (getValue temp) -99.99))
  (assert (char-equal (getUnit temp) ?F))

  (princ "Pass 3 Complete!" buf) (terpri buf)
  (princ "Conversions Passed!" buf) (terpri buf)

  ;; test isValid
  (princ "Testing isValid..." buf) (terpri buf)
  (assert (isValid -459.67 ?F))
  (assert (isValid -273.15 ?C))
  (assert (isValid    0.00 ?R))
  (assert (isValid    0.00 ?K))
  (assert (not (isValid -459.68 ?F)))
  (assert (not (isValid -273.16 ?C)))
  (assert (not (isValid   -0.01 ?R)))
  (assert (not (isValid   -0.01 ?K)))
  (princ "isValid Passed!" buf) (terpri buf)

  ;; test readIn
  (princ "testing readIn... writeOut..." buf) (terpri buf)
  (readIn temp)
  (writeOut temp buf)
  (princ "readIn Passed! writeOut Passed!" buf) (terpri buf)

  ;; test raising and lowering temp
  (princ "testing raiseTemp... lowerTemp..." buf) (terpri buf)
  (raiseTemp temp 25.0)
  (assert (= (getValue temp) 55.0))
  (lowerTemp temp 30.0)
  (assert (= (getValue temp) 25.0))
  (lowerTemp temp 500)
  (assert (= (getValue temp) 25.0))
  (princ "raiseTemp Passed! lowerTelp Passed!" buf) (terpri buf)

  ;; test equal and lessThan
  (princ "testing equal... lessThan..." buf) (terpri buf)
  (setq t1 (Temperature 30 ?C))
  (setq t2 (Temperature 86 ?F))
  (assert (equals t1 t2))
  (lowerTemp t1 3.0)
  (assert (lessThan t1 t2))
  (princ "equal Passed! lessThan Passed!" buf) (terpri buf)

  (princ "All Tests Passed!" buf) (terpri buf)
)
runTests

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; get input from user and print out a     ;;
;;; range of temperatures in all four units ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)
  (setq buf (switch-to-buffer-other-window "temp.out"))
  (runTests buf)

  (setq baseTemp (Temperature 0 ?F))
  (setq limitTemp (Temperature 100 ?F))
  (princ "Enter a base Temperature in the mini-buffer:\n" buf)
  (readIn baseTemp)
  (princ "Enter a limit Temperature in the mini-buffer:\n" buf)
  (readIn limitTemp)
  (setq stepValue (string-to-number 
		   (read-from-minibuffer "Now enter a value to step with: ")))
  (princ "Base Temperature is: " buf)
  (princ (toString baseTemp) buf) (terpri buf)
  (princ "Limit Temperature is: " buf)
  (princ (toString limitTemp) buf) (terpri buf)
  (princ "StepValue is: " buf)
  (princ stepValue buf) (terpri buf)

  (while (lessThan baseTemp limitTemp)
    (writeOut baseTemp buf)
    (raiseTemp baseTemp stepValue))
  (terpri buf)
)
t
