(require 'jup-fileio)

(ert-deftest test-jup-fileio-find-file ()
  (let ()
    )
  )


;; get-jup-fileio-dir(path) -> jup-fileio-dir
;; find-subdir(path) -> (dir1, dir2)
;; find-file(filename)

;; file-exists-p
;; buffer-file-name
;; find-file
;; make-directory
;; write-region
;; make-directory
;; make-empty-file
;; delete-file
;; delete-directory
;; directory-file-name
;; directory-files
(ert-deftest test-directory-files()
  (unwind-protect
      (progn
        (create-directory-environment-00)
        (let ((dirfiles (directory-files "parent")))
          (should (equal '("." ".." "sub1" "sub2") dirfiles))
          )

        )

    (progn
      (delete-directory-environment-00)) ))

;; TODO: make this work on windows...
(ert-deftest test-find-file()
  (unwind-protect
      (progn
        (create-directory-environment-00)
        (let ((cmd-result nil))
          (save-excursion
            (find-file "parent")
            ;; (setq cmd-result (shell-command-to-string "pwd"))
            (setq cmd-result (dired-current-directory))
            (should (equal cmd-result
                           "/home/john/jup/dotfiles/.emacs.jup/parent/"))
            )
          )
        )

    (progn
      (delete-directory-environment-00)) ))

(ert-deftest test-find-file-02()
  (unwind-protect
      (progn
        (create-directory-environment-00)
        (let ((cmd-result nil))
          (save-excursion
            (find-file "parent")
            (file-exists-p "sub3")


            ;; (setq cmd-result (shell-command-to-string "pwd"))
            ;; (setq cmd-result (dired-current-directory))
            ;; (should (equal cmd-result
            ;;                "/home/john/jup/dotfiles/.emacs.jup/parent/"))
            )
          )
        )

    (progn
      (delete-directory-environment-00)) ))
