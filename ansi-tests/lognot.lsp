;-*- Mode:     Lisp -*-
;;;; Author:   Paul Dietz
;;;; Created:  Tue Sep  9 06:16:20 2003
;;;; Contains: Tests of LOGNOT

(in-package :cl-test)

(compile-and-load "numbers-aux.lsp")

(deftest lognot.error.1
  (loop for x in *mini-universe*
	unless (or (integerp x)
		   (eq (eval `(classify-error (lognot ',x))) 'type-error))
	collect x)
  nil)

(deftest lognot.error.2
  (classify-error (lognot))
  program-error)

(deftest lognot.error.3
  (classify-error (lognot 0 0))
  program-error)

(deftest lognot.1
  (lognot 0)
  -1)

(deftest lognot.2
  (lognot -1)
  0)

(deftest lognot.3
  (lognot 123)
  -124)

(deftest lognot.4
  (loop for x = (random-from-interval (ash 1 (random 200)))
	for z = (lognot x)
	repeat 1000
	unless (and (if (>= x 0) (< z 0) (>= z 0))
		    (loop for i from 1 to 210
			  always (if (not (logbitp i x))
				     (logbitp i z)
				   (not (logbitp i z)))))
	collect (list x z))
  nil)
