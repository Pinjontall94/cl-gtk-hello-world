(defpackage cl-gtk-hello-world
  (:use :cl)
  (:export :main))
(in-package :cl-gtk-hello-world)

; Main window
(defvar window (make-instance 'gtk:gtk-window :type :toplevel :title "Hello world! :3"))
(defvar vbox (make-instance 'gtk:gtk-box :orientation :vertical
                                         :spacing 25
                                         :margin 25))

(defun hello-world ()
  "Creates a hello world window in GTK+3"
  (gtk:within-main-loop
   ; Quit program when window closed
   (gobject:g-signal-connect window "destroy" (lambda (widget)
                                               (declare (ignore widget))
                                               (gtk:leave-gtk-main)))
   ; Display GUI
   (gtk:gtk-container-add window vbox)
   (gtk:gtk-widget-show-all window))
  (gtk:join-gtk-main))

(defun hello (name)
  (format t "This is the start of something great, ~a!~%" name))

(defun help ()
  (format t "~&Usage:

  cl-gtk-hello-world [name]~&"))

(defun %main (argv)
  "Parse CLI args."
  (when (member "-h" argv :test #'equal)
    (help)
    (uiop:quit))
  (hello "Sam Johnson (she/her)")
  (hello-world))

(defun main ()
  "Entry point for the executable.
  Reads command line arguments."
  ;; uiop:command-line-arguments returns a list of arguments (sans the script name).
  ;; We defer the work of parsing to %main because we call it also from the Roswell script.
  (%main (uiop:command-line-arguments)))
