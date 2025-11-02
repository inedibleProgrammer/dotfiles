;;; -*- lexical-binding: t -*-

(require 'ert)
(require 'jup-test-helper)

(defclass Rectangle ()
  () "First class ever made")

(ert-deftest test-class-01 ()
  ;; (Shape :value 3 :reference nil)
  (setq rect (make-instance 'Rectangle))
  )


(ert-deftest test-delete-nonexistent-directory-returns-error()
  (let ((dummy-dir "does-not-exist"))
    (should (not (file-directory-p dummy-dir)))

    (condition-case error
	(delete-directory dummy-dir)
      (error 3
	     (should (string-equal (error-message-string error)
				   "Removing directory: No such file or directory, /home/john/jup/dotfiles/.emacs.jup/does-not-exist"))))))

(ert-deftest test-make-directory()
  (let ((dirname "temp1"))
    (make-directory dirname)
    (should (file-directory-p dirname))
    (delete-directory dirname)))

(ert-deftest test-expand-filename()
  (let ((dirname "temp2"))
    (make-directory dirname)
    (setq dirname-expanded (expand-file-name dirname))
    (should (string-equal dirname-expanded "/home/john/jup/dotfiles/.emacs.jup/temp2"))
    (delete-directory dirname)))

(ert-deftest test-environment-00()
  (unwind-protect
      (progn
	(create-directory-environment-00)
	)
      (delete-directory-environment-00))
  )


