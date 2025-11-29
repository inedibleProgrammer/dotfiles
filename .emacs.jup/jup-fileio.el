;;; -*- lexical-binding: t -*-

(require 'ert)
(require 'jup-test-helper)

(cl-defstruct jup-fileio-dir
  path
  subdirs)

(cl-defstruct jup-fileio
  file-exists
  )

(defun jup-fileio-create()
  (let (
        (jfi (make-jup-fileio))
        )
    (setf (jup-fileio-file-exists jfi) #'file-exists-p)
    jfi
    )
  )

(defun jup-fileio-dir-create(path)
  )

(defun jup-fileio-create-scenario(jfd)
  
  )

(defun jup-fileio-delete-scenario()
  )




(defun jup-fileio-find-file(dirpath filename)
  (let ()
    )
  )





(provide 'jup-fileio)
