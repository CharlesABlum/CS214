;;; quad.el uses the quadratic formula to compute
;;; the roots of a 2nd degree polynomial.
;;;
;;; Input: a, b, c, real number which are the coefficients
;;; Output: root1, root2, the roots of the polynomial
;;;
;;; Begun by: Charles Blum, for CS 214 at Calvin College.
;;; Completed by:Charles Blum
;;; Date: 12 March 2014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:;;;;;;
;;; quad() uses the quadratic formula to calculate the roots  
;;; of a 2nd degree polynomial
;;; Receive: a, b, c, the coefficients of the polynomial                                   
;;; PRE: a, b, and c are real numbers
;;; Return: root1 and root2, the roots of the polynomial
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun quadRoots (a b c)
  (setq arg (- (* b b) (* 4 a c)))
  (if (= a 0)
      (progn (list "coefficient a is Zero! Please try again."
	     (setq root1 0.0)
	     (setq root2 0.0)
	     ))
    (if (< arg 0)
	(progn (list "b^2 - 4ac is negative! Please try again."
	       (setq root1 0.0)
	       (setq root2 0.0)
	       ))
      (progn (list "valid" 
	     (/ (+ (- b) (sqrt arg)) (* 2 a))
	     (/ (- (- b) (sqrt arg)) (* 2 a))
	     ))
      )
  ) 
)

(defun main (a b c)
  (interactive "na=\nnb=\nnc=")
  (setq roots (quadRoots a b c))
  (setq valid (elt roots 0))
  (if (equal valid "valid")
    (progn  (setq root1 (elt roots 1))
	    (setq root2 (elt roots 2))
	    (message "The first root is %i \nand the second root is %i" root1 root2)
    )
	(message "%s\nSomething didn't calculate right. Please try again." valid)
  )
)





