;;; factorial.el computes the factorial of a number.
;;;
;;; Input: n, and integer
;;; PRE: n >= 0 
;;; Output: the factorial of n
;;;
;;; Begun by: Charles Blum, for CS 214 at Calvin College.
;;; Begun on: 4 March 2014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; computeFactorial() recursively generates the factorial            ;;;
;;; of a number n                                                     ;;;
;;; Receive: n, an integer                                            ;;;
;;; Output: The factorial of n                                        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun computeFactorial (n f)
  (if (> n 0) 
    (computeFactorial (- n 1) (* f n))
    f
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main is a 'driver' for displayLogTable()                   ;;;
;;; Input: start, stop and increment.                          ;;;
;;; Output: The table of logs from start to stop by increment  ;;;
;;;          in a buffer named 'logTable.out'.                 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (n)
  "Compute and display the factorial of n"
   (interactive "nEnter an integer n to compute the factorial: ")
   (setq factorial (computeFactorial n 1))
   (message "n! = %i" factorial)
)











