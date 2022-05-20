(defsystem "cl-gtk-hello-world"
  :version "0.1.0"
  :author "Sam Johnson (she/her)"
  :license "AGPLv3 or later"
  :depends-on ("cl-cffi-gtk")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Jumping off point for GTK+3 apps in Common Lisp"
  :in-order-to ((test-op (test-op "cl-gtk-hello-world/tests")))
  ;; Build a binary:
  ;; don't change this line.
  :build-operation "program-op"
  ;; binary name: adapt.
  :build-pathname "cl-gtk-hello-world"
  ;; entry point: here "main" is an exported symbol. Otherwise, use a double ::
  :entry-point "cl-gtk-hello-world:main")


(defsystem "cl-gtk-hello-world/tests"
  :author "Sam Johnson (she/her)"
  :license "AGPLv3 or later"
  :depends-on ("cl-gtk-hello-world"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-gtk-hello-world"
  :perform (test-op (op c) (symbol-call :rove :run c)))
