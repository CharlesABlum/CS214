;;; year_codes.el is a driver for function yearCode.
;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;; Completed by: Charles Blum for CS 214

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; yearCode returns the code for a given academic year.                 ;;;
;;; Receive: year, a string.                                             ;;;
;;; Precondition: year is one of {freshman, sophomore, junior or senior}.;;;
;;; Return: the integer code corresponding to year.                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main function                        ;;;
;;; input: year                          ;;;
;;; output: code corresponding to year   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (year)
 (interactive "sEnter your academic year: ")  ; read year
 (message "%d" (yearCode year)))              ; display its code

(defun yearCode (year)
 "return the corresponding year" 
 (if (equal year "freshman") 1
 (if (equal year "sophmore") 2
 (if (equal year "junior") 3
 (if (equal year "senior") 4 0)))))
