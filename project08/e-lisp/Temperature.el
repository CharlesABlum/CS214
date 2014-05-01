;;; Temperature.el simulates an e-LISP Temperatyre type
;;;  and operations on that type.
;;;
;;; Begun by: Charles Blum, for CS 214 at Calvin College.
;;; Completed by: Charles Blum
;;; Date: 15 April 2014
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Temperature constructs a temp from a real number;;
;;; and a character representing the units          ;;
;;; Receive: value, a real and unit, a strings.     ;;
;;; Return: the tuple (value unit).                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Temperature(value unit)
  (list (round2 value) unit))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getters and setters for the Temperature object      ;;
;;; getters Return: the appropiate entry of Temperature ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getValue(theTemp)
  (car theTemp))

(defun getUnit(theTemp)
  (car (cdr theTemp)))

(defun setValue (theTemp value)
  (setcar theTemp value)
  theTemp)

(defun setUnit(theTemp unit)
  (setf (car (cdr theTemp)) unit)
  theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; toX converts a Temperature to the X unit system.    ;;
;;; unit systems are:                                   ;;
;;; Fahrenheit (F)                                      ;;
;;; Rankine    (R)                                      ;;
;;; Celcius    (C)                                      ;;
;;; Kelvin     (K)                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun toF(theTemp)
  (if (char-equal (getUnit theTemp) ?C)
      (progn (setUnit theTemp ?F)
	     (setValue theTemp (round2 (+ 32 (* 1.80 (getValue theTemp))))))
  (if (char-equal (getUnit theTemp) ?R)
      (progn (setUnit theTemp ?F)
	     (setValue theTemp (round2 (- (getValue theTemp) 459.67))))
  (if (char-equal (getUnit theTemp) ?K)
      (progn (setUnit theTemp ?F)
	     (setValue theTemp (round2 (- (* 1.80 (getValue theTemp)) 459.67))))
    )))
  theTemp)

(defun toC(theTemp)
  (if (char-equal (getUnit theTemp) ?F)
      (progn (setUnit theTemp ?C)
	     (setValue theTemp (round2 (* (/ 5.0 9.0) (- (getValue theTemp) 32.0)))))
  (if (char-equal (getUnit theTemp) ?R)
      (progn (setUnit theTemp ?C)
	     (setValue theTemp (round2 (-  (* (/ 5.0 9.0) (getValue theTemp)) 273.15))))
  (if (char-equal (getUnit theTemp) ?K)
      (progn (setUnit theTemp ?C)
	     (setValue theTemp (round2 (- (getValue theTemp) 273.15))))
    )))
  theTemp)

(defun toR(theTemp)
  (if (char-equal (getUnit theTemp) ?F)
      (progn (setUnit theTemp ?R)
	     (setValue theTemp (round2 (+ 459.67 (getValue theTemp)))))
  (if (char-equal (getUnit theTemp) ?C)
      (progn (setUnit theTemp ?R)
	     (setValue theTemp (round2 (+ 491.67 (* 1.80 (getValue theTemp))))))
  (if (char-equal (getUnit theTemp) ?K)
      (progn (setUnit theTemp ?R)
	     (setValue theTemp (round2 (* 1.80 (getValue theTemp)))))
  )))
  theTemp)

(defun toK(theTemp)
  (if (char-equal (getUnit theTemp) ?F)
      (progn (setUnit theTemp ?K)
	     (setValue theTemp (round2 (* (/ 5.0 9.0) (+ 459.67 (getValue theTemp))))))
  (if (char-equal (getUnit theTemp) ?C)
      (progn (setUnit theTemp ?K)
	     (setValue theTemp (round2  (+ 273.15 (getValue theTemp)))))
  (if (char-equal (getUnit theTemp) ?R)
      (progn (setUnit theTemp ?K)
	     (setValue theTemp (round2 (* (/ 5.0 9.0) (getValue theTemp)))))
  )))
  theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; round drops everything after 2 decimal places.      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun round2(number)
  ;;(format "%0.2f" number)) convers to string, don't want that
  ;;(* 0.01 (fround (* 100.00 number))))
  (string-to-number (format "%0.2f" number)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; toString convert a Temperature to a string          ;;
;;; for convenient output                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun toString(theTemp)
  (concat (format "%7.2f" (getValue theTemp)) " " (char-to-string (getUnit theTemp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; raiseTemp takes a Temperature and raises its value  ;;
;;; by step                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun raiseTemp(theTemp step)
  (if (< step 0.00)
      (lowerTemp theTemp step)
    (setValue theTemp (+ (getValue theTemp) step)))
  theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lowerTemp takes a Temperature and lowers its value  ;;
;;; by step.  Before doing so it checks to make sure the;;
;;; new value is valid.                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun lowerTemp(theTemp step)
  (if (< step 0.00)
      (raiseTemp theTemp (* step -1))
    (if (isValid (- (getValue theTemp) step) (getUnit theTemp))
	(setValue theTemp (- (getValue theTemp) step))))
  theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; equals checks the equality between two Temperatures ;;
;;; and does so across unit systems.                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun equals(temp1 temp2)
  (let ((dlt1 (copy-sequence temp1))
	(dlt2 (copy-sequence temp2)))
    (toK dlt1)
    (toK dlt2)
    (= (getValue dlt1) (getValue dlt2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lessThan checks to see if the value of temp1 < temp2;;
;;; and does so across unit systems.                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun lessThan(temp1 temp2)
  (let ((dlt1 (copy-sequence temp1))
	(dlt2 (copy-sequence temp2)))
    (toK dlt1)
    (toK dlt2)
    (< (getValue dlt1) (getValue dlt2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; isValid checks the validity of a (value unit) tuple ;;
;;; in F: value > -459.67                               ;;
;;; in R: value >    0.00                               ;;
;;; in C: value > -273.15                               ;;
;;; in K: value >    0.00                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun isValid(value unit)
  (if (or (or (char-equal unit ?F) (char-equal unit ?R))
           (or (char-equal unit ?C) (char-equal unit ?K)))
      (if (and (>= value 0.0) (or (char-equal unit ?K) (char-equal unit ?R)))
	  (setq valid t)
      (if (and (>= value -273.15) (char-equal unit ?C))
	  (setq valid t)
      (if (and (>= value -459.67) (char-equal unit ?F))
	  (setq valid t)
      (setq valid nil))))
  (setq valid nil))
  valid)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; readIn reads in a Temperature from the user.        ;;
;;; It also checks the validity of the input            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun readIn(theTemp)
  (princ "The format is 'xxx.xx A' where xxx.xx is a real value\n" buf)
  (princ "and A is a character representing a unit system (F, C, R, K)\n" buf)

  ;; seed values for the loop
  (setq value -460.00)
  (setq unit ?F)
  (while (not (isValid value unit))
    (setq inTemp (upcase (read-from-minibuffer "Enter here: ")))
    (setq value (string-to-number inTemp))
    (setq unit (string-to-char (byte-to-string (aref inTemp (- (length inTemp) 1)))))
    (if (not (isValid value unit))
	(princ "Not a valid Temperature.  Please try again." buf)))
  (setValue theTemp value)
  (setUnit  theTemp unit)
  theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; writeOut outputs a Temperature in a convenient form.;;
;;; Namely it outputs the value in all 4 unit systems.  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun writeOut(theTemp buf)
  (let ( (aTemp (copy-sequence theTemp)) )
    (princ (toString (toF aTemp)) buf) (princ ",\t" buf)
    (princ (toString (toC aTemp)) buf) (princ ",\t" buf) 
    (princ (toString (toR aTemp)) buf) (princ ",\t" buf)
    (princ (toString (toK aTemp)) buf) (princ "\n"  buf))
  theTemp)