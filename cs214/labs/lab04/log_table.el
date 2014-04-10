;;; log_table.el displays a table of logarithms.
;;;
;;; Input: start, stop and increment, three reals.
;;; PRE: start < stop and increment > 0.
;;; Output: A table of logarithms from start to stop,
;;;          with interval of increment.
;;;
;;; Begun by: Adams, for CS 214 at Calvin College.
;;; Completed by: Charles Blum
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; displayLogTable() recursively generates the actual table of logs. ;;;
;;; Receive: start and stop, the limit values for the table;          ;;;
;;;             increment, the step value for the table;              ;;;
;;;             buf, the buffer in which to display the table.        ;;;
;;; Output: The table of logs from start to stop, by increment.       ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun displayLogTable (start stop increment buf)
  (if (<= start stop) 
      (progn (princ "The Logarithm of " buf)
	     (princ start buf)
	     (princ " is " buf)
	     (princ (log10 start) buf)
	     (terpri buf)
	     (displayLogTable (+ start increment) stop increment buf)
      )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main is a 'driver' for displayLogTable()                   ;;;
;;; Input: start, stop and increment.                          ;;;
;;; Output: The table of logs from start to stop by increment  ;;;
;;;          in a buffer named 'logTable.out'.                 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (start stop increment)
  "print a table of logarithms"
   (interactive "nEnter starting value: \nnEnter stopping value: \nnEnter increment value: ")
   (if (get-buffer "log_table.out")
       (kill-buffer "log_table.out"))
   (setq buf (switch-to-buffer-other-window "log_table.out"))
   (displayLogTable start stop increment buf))










