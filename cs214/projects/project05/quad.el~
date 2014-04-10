;;; split.el splits a string into two substrings.
;;;
;;; Input: aString, the string to be split,
;;;        pos, the split position.
;;; Output: the substring of aString before pos, and
;;;         the substring of aString from pos onwards.
;;;
;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;; Completed by:Charles Blum
;;; Date:9 March 2014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:;
;;; split() splits a string into its two substrings.  
;;; Receive: aString, the string to be split,         
;;;        pos, the split position.                   
;;; PRE: 0 <= pos < the length of aString.
;;; Return: the substring of aString before pos, and  
;;;         the substring of aString from pos onwards.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split (aString pos)
  (setq p1 (substring aString 0 pos))
  (setq p2 (substring aString pos))
  (list p1 p2) 
)

(defun main (aString pos)
  (interactive "sEnter the string to be split: \nnEnter the split position")
  (setq result (split aString pos))
  (setq part1 (elt result 0))
  (setq part2 (elt result 1))
  (message "The first part is %s and the second part is %s" part1 part2))

