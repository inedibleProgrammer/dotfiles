;;; -*- lexical-binding: t -*-

(require 'ert)
(require 'jup-fileio)

; These are more like categories
(defvar jup-note-dirs
  '("/home/john/jup/PrivateNotes/Bible"
    "/home/john/jup/PrivateNotes/Life"
    "/home/john/jup/PrivateNotes/Technical"
        ))

(cl-defstruct jup-note
  jfi
  )

(defun generate-yyyymmddhhmmss-timestamp ()
  "Return the current date and time as a string in YYYYMMDDHHMMSS format."
  (interactive)
  
  ;; The format string breakdown:
  ;; %Y: Year (e.g., 2025)
  ;; %m: Month (01-12)
  ;; %d: Day (01-31)
  ;; %H: Hour (00-23)
  ;; %M: Minute (00-59)
  ;; %S: Second (00-60)
  (format-time-string "%Y%m%d%H%M%S" (current-time)))

;; Test:
;; (message "Current timestamp: %s" (generate-yyyymmddhhmmss-timestamp))

;; (defun dolist-and-bail-on-check (check-fn)
;; )

(defun jup-note-follow-link-action()
  "Wrapper around jup-note-follow-link

This function ensures that jup-note-follow-link is called with
(word-at-point) as the argument"
  (let* (
         (jfi (jup-fileio-create))
         (jn (make-jup-note :jfi jfi))
         (file (word-at-point))
         result
         rdm
         )
    (setq result (jup-note-follow-link jn jup-note-dirs file))

    (if (stringp result)
        (progn
          (setq rdm (concat result "/README.md"))
          (find-file rdm)
          )
        )
    )
  )

(defun jup-note-check-directory-for-file (jn dir file)
  (let (
        (jfi (jup-note-jfi jn))
        (full (concat dir (concat "/" file)))
        found
        )
    (setq found (funcall (jup-fileio-file-exists jfi) full))
    (if found
        full
      nil
        )
    )
  )

(defun jup-note-follow-link(jn dirlist timestamp)
  (let (
        (jfi (jup-note-jfi jn))
        (tries 100)
        found
        cwd
        (dirlist2 dirlist)
        )
    (while (and (not found)
                (> tries 0)
                (> (length dirlist2) 0))
      (setq cwd (car dirlist2))
      (setq found (jup-note-check-directory-for-file jn cwd timestamp))
      (setq dirlist2 (cdr dirlist2))
      (setq tries (- tries 1))
      )
    (if (equal tries 0)
        'tries-exceeded
      )
    (if found
        found
      'not-found
      )
    )
  )


(defun jup-note-create-reference()
  "When you're in a note, this generates the `[first-line](timestamp)` string for you"
  )




(provide 'jup-note)
