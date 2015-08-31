;-*- Mode:     Lisp -*-
;;;; Author:   Paul Dietz
;;;; Created:  Mon Feb 23 05:20:41 2004
;;;; Contains: Load tests of the reader

(in-package :cl-test)

(load "reader/reader-test.lsp")
(load "reader/with-standard-io-syntax.lsp")
(load "reader/copy-readtable.lsp")
(load "reader/read.lsp")
(load "reader/read-preserving-whitespace.lsp")
(load "reader/read-delimited-list.lsp")
(load "reader/read-from-string.lsp")
(load "reader/readtable-case.lsp")
(load "reader/readtablep.lsp")
(load "reader/get-macro-character.lsp")
(load "reader/set-macro-character.lsp")
(load "reader/read-suppress.lsp")
(load "reader/set-syntax-from-char.lsp")
(load "reader/dispatch-macro-characters.lsp")

(load "reader/syntax.lsp")
(load "reader/syntax-tokens.lsp")
