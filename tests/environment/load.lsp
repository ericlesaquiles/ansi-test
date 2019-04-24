;-*- Mode:     Lisp -*-
;;;; Author:   Paul Dietz
;;;; Created:  Sun Dec 12 19:43:17 2004
;;;; Contains: Load environment tests (section 25)

(in-package :cl-test)

(let ((*default-pathname-defaults*
       (make-pathname
        :directory (pathname-directory *load-pathname*))))
  (load "apropos.lsp")
  (load "apropos-list.lsp")
  (load "describe.lsp")
;;   (load "disassemble.lsp") -- NOT SUPPORTED as of now
  (load "environment-functions.lsp")
  (load "room.lsp")
  (load "time.lsp")
;;  (load "trace.lsp") ;; and untrace
  (load "user-homedir-pathname.lsp")

  (load "decode-universal-time.lsp")
  (load "encode-universal-time.lsp")
  (load "get-universal-time.lsp")
  (load "sleep.lsp")
  (load "get-internal-time.lsp")

  (load "documentation.lsp")
;;   #-lispworks (load "inspect.lsp")
  (load "dribble.lsp")
  (load "ed.lsp")
  )
