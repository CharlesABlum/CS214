;;; mylist.el is a "module" of list operations.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by:Charles Blum
;;; Date:21 April 2014

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Max2 finds the maximum of two values.       ;;
;;; Receive: val1, val2, two values.            ;;
;;; PRE: val1 and val2 can be compared using <. ;;
;;; Return: the maximum of val1 and val2.       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Max2 (val1 val2)
  (if (> val1 val2)
      val1
    val2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Max finds the maximum value in a list.         ;;
;;; Receive: aList, a list of values.              ;;
;;; PRE: values in aList can be compared using <.  ;;
;;; Return: the maximum value in aList.            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Max(aList)
  (if (listp aList)
     (if (= (length aList) 0)
	 nil
       (if (= (length aList) 1)
	   (car aList)
	 (Max2 (car aList) (Max (cdr aList)))
	 )
       )
    nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Index finds the index fo a number in the list. ;;
;;; Receive: aList, a list of values.              ;;
;;;          number, the number to find            ;;
;;; Return: the index of number in aList.          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun IndexHelper(aList number)
  (if (listp aList)
     (if (= (length aList) 0)
	 1
       (if (= (car aList) number)
	   0
	 (+ (IndexHelper (cdr aList) number) 1)
	 )
       )
    nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Index finds the index fo a number in the list. ;;
;;; Receive: aList, a list of values.              ;;
;;;          number, the number to find            ;;
;;; Return: the index of number in aList.          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Index(aList number)
  (if (listp aList)
     (progn (if (= (length aList) 0)
		(setq indexOf -1)
	      (setq indexOf (IndexHelper aList number))
	      )
	    (if (>= indexOf (length aList))
		-1
	      indexOf))
    nil))