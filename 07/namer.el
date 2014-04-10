;;; namer.el simulates and tests an e-LISP Name type.
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Charles Blum
;;; Date: 10 April 2014

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Name constructs a name from three strings.      ;;
;;; Receive: first, middle and last, three strings. ;;
;;; Return: the triplet (first middle last).        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Name (first middle last)
  (list first middle last))
Name

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst extracts the first name of a name object.;
;;; Receive: theName, a Name.                       
;;; Return: the first string in theName.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getFirst (theName)
  (car theName))
getFirst

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle extracts the middle name of a name object.
;;; Receive: theName, a Name.                      
;;; Return: the second string in theName.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getMiddle (theName)
  (car (cdr theName)))
getMiddle

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast extracts the last name of a name object.;;;
;;; Receive: theName, a Name.                       ;;;   
;;; Return: the third string in theName.            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getLast (theName)
  (car (cdr (cdr theName))))
getLast

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName returns a full name in F-M-L order. ;;;
;;; Return: myFirst, myMiddle, myLast.              ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getFullName (theName)
  (concat (getFirst theName) " " (getMiddle theName) " " (getLast theName)))
getFullName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName displays a name object.        ;;; 
;;; Receive: theName, a Name,                ;;; 
;;;          buffer, the name of a buffer.   ;;;
;;; Output: the strings in theName to buffer.;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun printName (theName buf)
  (princ (getFullName theName) buf)
  theName)
printName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Project07 changes                        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Setters for Name                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setFirst (theName first)
  (setcar theName first))
setFirst

(defun setMiddle(theName middle)
  (setf (car (cdr theName)) middle))
setMiddle

(defun setLast (theName last)
  (setf (car (cdr (cdr theName))) last))
setLast

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lfmi returns a formatted version of the  ;;;
;;; name: Last, First Middle Initial         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun lfmi(theName)
  (concat (getLast theName) ", " (getFirst theName) " " (string-to-char (getFirst theName)) "."))
lfmi

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Get a new name from the user via the     ;;;
;;; mini-buffer                              ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun readName()
  (list (read-from-minibuffer "Enter a new first name: ")
	(read-from-minibuffer "Enter a new middle name: ")
	(read-from-minibuffer "Enter a new last name: ")))
readName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name

  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))

  (setq buf (get-buffer "namer.el"))         ; buf = this buffer
  (assert (eq (printName aName buf) aName) ) ; output
  (terpri buf)                               ; newline
  (princ "lab07 tests passed!\n")

  (setFirst aName "Paul")
  (assert (equal (getFirst aName) "Paul"))
  (setMiddle aName "John")
  (assert (equal (getMiddle aName) "John"))
  (setLast aName "Smith")
  (assert (equal (getLast aName) "Smith"))
  (assert (eq (printName aName buf) aName))
  (terpri buf)

  (setq aName (readName))
  (assert (not (equal (getFirst aName) "Paul")))
  (assert (not (equal (getMiddle aName) "John")))
  (assert (not (equal (getLast aName) "Smith")))
  (assert (eq (printName aName buf) aName))
  (terpri buf)
  (princ "project07 tests passed!\n")

  (princ "All tests passed!\n")                ; feedback
  (terpri buf)                               ; newline
)
John Paul Jones
lab07 tests passed!
Paul John Smith
Charles Albert Blum
project07 tests passed!
All tests passed!

t
