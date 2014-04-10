;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;;; circle_area.el computes the area of a circle. 
;;;                                                                     
;;; Input: The radius of the circle.                                    
;;; Precondition: The radius is a positive number.                      
;;; Output: The area of the circle.                                     
;;; 
;;; Begun by: Dr. Nelesen, for CS 214 at Calvin College.
;;; Completed by: Charles Blum
;;; Date: 06 February 2014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   

;;; function circleArea computes a circle's area, given its radius.     
;;; Parameters: r, a number.                                            
;;; Precondition: r >= 0.                                               
;;; Returns: the area of the circle whose radius is r.                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  
(defun circleArea (radius)  ; beginning of the function circleArea with paramater radius
  "Compute the area of a circle, passed its radius."
  (defconst PI 3.1415927)   ; defines a constant PI             
  (* PI (* radius radius))) ; loads everything into an equation stack, calculates and returns the value         

(defun circle_area(r)       ; beginning of the function circle_area with parameter r which is passed from the user interactively
 "Compute the area of a circle, given its radius interactively."
  (interactive "nRadius: ") ; get the radius from the user        
  (setq area (circleArea r)); sets the reutrned value from circleArea to area     
  (message "The circle's area is %f." area)) ; output to the user with the calculated value


