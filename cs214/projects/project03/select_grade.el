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
;;; input: numberic grade                ;;;
;;; output: letter grade                 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (grade)
 (interactive "sEnter your numeric grade: ")  ; read year
 (message "%d" (selectGrade grade)))              ; display its code

(defun selectGrade (grade)
  (cond ((and (>= grade 90) (<= grade 100)) "A")
	((and (>= grade 80) (<  grade 90))  "B")
	((and (>= grade 70) (<  grade 80))  "C")
	((and (>= grade 60) (<  grade 70))  "D")
	((and (>= grade  0) (<  grade 60))  "F")
	(t "Invalid grade!")))






