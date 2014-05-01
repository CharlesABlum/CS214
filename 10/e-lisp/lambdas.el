;;; lab 10 - learning about (lambda
;;;
;;; Name: Charles Blum
;;; For: CS 214, lab 10
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(lambda (x) (+ x x))
(lambda (x) (+ x x))

((lambda (x) (+ x x)) 17)
34

(lambda (alist) (max (abs (car alist))
		      (abs (car (cdr alist)))
		      (abs (car (cdr (cdr alist))))
		      (abs (car (cdr (cdr (cdr alist)))))
		      ))

((lambda (alist) (max (abs (car alist))
		      (abs (car (cdr alist)))
		      (abs (car (cdr (cdr alist))))
		      (abs (car (cdr (cdr (cdr alist)))))
		      ))
 (list 1 -2 3 -4))
4

(lambda (x y z) (+ x y z))
((lambda (x y z) (+ x y z))
 1 2 3 )
6

(lambda (x) (null x))
((lambda (x) (null x))
 10)
nil

(lambda () 17.2)
((lambda () 17.2)
 )
17.2

(function abs)
abs
#'abs
abs

(setq double (function (lambda (x) (+ x x)) ))
(lambda (x) (+ x x))

(double 11)
(funcall double 11)
22

(setq triple (function (lambda (x) (* 3 x)) ))
(lambda (x) (* 3 x))

(funcall triple 11)
33

(apply #'+ '(1 2 3))
6

(apply #'+ 1 2 '(3 4 5))
15

(apply #'+ 1 '(3 4 5) 2)

(funcall #'+ 1 2 3 4)
10

(funcall #'cons 'a 'b)
(a . b)

(mapcar #'evenp '(1 2 3 4))

(defun subtract-n (n alist)
  (mapcar #'(lambda (x) (- x n)) alist))
subtract-n

(subtract-n 2 '(2 4 6))
(0 2 4)

(defun sum-squares (alist)
  (apply #'+  (mapcar #'(lambda (x) (expt x 2)) alist))  )

sum-squares

(sum-squares '(1 2 3))
14
(sum-squares '(1 2 3 4 5))
55
(sum-squares '(-1 -2 -3 0 1))
15


