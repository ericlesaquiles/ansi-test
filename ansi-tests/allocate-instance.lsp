;-*- Mode:     Lisp -*-
;;;; Author:   Paul Dietz
;;;; Created:  Mon Apr 28 21:06:58 2003
;;;; Contains: Tests of ALLOCATE-INSTANCE

(in-package :cl-test)

;;; According to the CLHS, the meaning of adding methods to
;;; ALLOCATE-INSTANCE is unspecified, so this will not be tested
;;; here.

(defclass allocate-instance-class-01 ()
  ((a :initform 'x) (b :initarg :b)
   (c :type float) (d :allocation :class)
   (e :initarg :e) (f :documentation "foo"))
  (:default-initargs :b 'y))

(deftest allocate-instance.1
  (let* ((class (find-class 'allocate-instance-class-01))
	 (obj (allocate-instance class)))
    (values
     (eqt (class-of obj) class)
     (typep* obj 'allocate-instance-class-01)
     (typep* obj class)
     (map-slot-boundp* obj '(a b c d e f))))
  t t t
  (nil nil nil nil nil nil))

(deftest allocate-instance.2
  (let* ((class (find-class 'allocate-instance-class-01))
	 (obj (allocate-instance class
				 :foo t :a 10 :b 12 :c 1.0 :d 'a :e 17
				 :f nil :bar t)))
    (values
     (eqt (class-of obj) class)
     (typep* obj 'allocate-instance-class-01)
     (typep* obj class)
     (map-slot-boundp* obj '(a b c d e f))))
  t t t
  (nil nil nil nil nil nil))

(deftest allocate-instance.3
  (let* ((class (find-class 'allocate-instance-class-01))
	 (obj (allocate-instance class :allow-other-keys nil :xyzzy t)))
    (values
     (eqt (class-of obj) class)
     (typep* obj 'allocate-instance-class-01)
     (typep* obj class)
     (map-slot-boundp* obj '(a b c d e f))))
  t t t
  (nil nil nil nil nil nil))

(defclass allocate-instance-class-02 ()
  (a (b :allocation :class)))

(deftest allocate-instance.4
  (let ((class (find-class 'allocate-instance-class-02)))
    (setf (slot-value (allocate-instance class) 'b) 'x)
    (let ((obj (allocate-instance class)))
      (values
       (eqt (class-of obj) class)
       (typep* obj 'allocate-instance-class-02)
       (typep* obj class)
       (slot-boundp* obj 'a)
       (slot-value obj 'b))))
  t t t nil x)

(defstruct allocate-instance-struct-01
  a
  (b 0 :type integer)
  (c #\a :type character)
  (d 'a :type symbol))

(deftest allocate-instance.5
  (let* ((class (find-class 'allocate-instance-struct-01))
	 (obj   (allocate-instance class)))
    (setf (allocate-instance-struct-01-a obj) 'x
	  (allocate-instance-struct-01-b obj) 1234567890
	  (allocate-instance-struct-01-c obj) #\Z
	  (allocate-instance-struct-01-d obj) 'foo)
    (values
     (eqt (class-of obj) class)
     (typep* obj 'allocate-instance-struct-01)
     (typep* obj class)
     (allocate-instance-struct-01-a obj)
     (allocate-instance-struct-01-b obj)
     (allocate-instance-struct-01-c obj)
     (allocate-instance-struct-01-d obj)))
  t t t
  x 1234567890 #\Z foo)

	  
	  

