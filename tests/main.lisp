(defpackage cl-gtk-hello-world/tests/main
  (:use :cl
        :cl-gtk-hello-world)
  (:local-nicknames (:rv :rove)
(in-package :cl-gtk-hello-world/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-gtk-hello-world)' in your Lisp.

(rv:deftest test-target-1
  (rv:testing "should (= 1 1) to be true"
    (rv:ok (= 1 1))))
