(require 'ert)

(defun create-directory-environment-00()
  (let ((parent "parent")
	(sub1 "/sub1")
	(sub2 "/sub2"))
  (make-directory parent)
  (make-directory (concat (expand-file-name parent) sub1))
  (make-directory (concat (expand-file-name parent) sub2))))

(defun delete-directory-environment-00()
  (let ((parent "parent")
	(sub1 "/sub1")
	(sub2 "/sub2"))
  (delete-directory (concat (expand-file-name parent) sub1))
  (delete-directory (concat (expand-file-name parent) sub2))
  (delete-directory parent)))



(provide 'jup-test-helper)
