;;; Tests of conditions
(compile-and-load "ANSI-TESTS:AUX;types-aux.lsp")
(compile-and-load "ANSI-TESTS:AUX;define-condition-aux.lsp")

(in-package :cl-test)

(let ((*default-pathname-defaults*
       (make-pathname
        :directory (pathname-directory *load-pathname*))))
  (load "condition.lsp")
  (load "cell-error-name.lsp")
  (load "assert.lsp")
  (load "error.lsp")
  (load "cerror.lsp")
  (load "check-type.lsp")
  (load "warn.lsp")
  (load "invoke-debugger.lsp")
  ;; NOT SUPPORTED
  ;; (load "handler-bind.lsp")
  ;; (load "handler-case.lsp")
  ;; (load "ignore-errors.lsp")
  ;; (load "define-condition.lsp")
  (load "compute-restarts.lsp")
  (load "restart-bind.lsp")
  (load "restart-case.lsp")
  (load "with-condition-restarts.lsp")
  (load "with-simple-restart.lsp")
  (load "abort.lsp")
  (load "muffle-warning.lsp")
  (load "continue.lsp")
  (load "store-value.lsp")
  (load "use-value.lsp")
  (load "make-condition.lsp")
)
