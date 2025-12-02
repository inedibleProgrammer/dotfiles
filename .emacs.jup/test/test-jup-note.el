(require 'jup-note)



(defun jup-mock-file-exists (filename)
  (cond 
   ((equal filename "/my/dir1/file-exists")
    t)
   (t nil)
   )
  )

(ert-deftest test-mock-file-exists ()
  (should (equal (jup-mock-file-exists "123") nil))
  (should (equal (jup-mock-file-exists "/my/dir1/file-exists") t))
  )

(defun jup-create-mock-fileio()
  (let (
        (mjfi (make-jup-fileio))
        )
    (setf (jup-fileio-file-exists mjfi) #'jup-mock-file-exists)
    mjfi
    )
  )

(ert-deftest test-jup-note-check-directory-for-file ()
  (let* (
         (dir "/my/dir1")
         (mjfi (jup-create-mock-fileio))
         (jn (make-jup-note :jfi mjfi))
         (file "file-exists")
         )
    (setq result (jup-note-check-directory-for-file jn dir file))
    (should (equal result "/my/dir1/file-exists"))
    )
  )

(ert-deftest test-jup-note-follow-link-not-found ()
  (let* (
         (dirlist '("/my/dir1"))
         (mjfi (jup-create-mock-fileio))
         (jn (make-jup-note :jfi mjfi))
        )

    (should (equal (jup-note-follow-link jn dirlist "123") 'not-found))
    )
  )

(ert-deftest test-jup-note-follow-link-found ()
  (let* (
         (dirlist '("/my/dir1" "/my/dir2" "/my/dir3"))
         (mjfi (jup-create-mock-fileio))
         (jn (make-jup-note :jfi mjfi))
        )

    (should (equal
             (jup-note-follow-link jn dirlist "file-exists")
             "/my/dir1/file-exists"))
    )
  )

