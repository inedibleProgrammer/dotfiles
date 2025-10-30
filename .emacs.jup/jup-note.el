;;; -*- lexical-binding: t -*-

(setq jup-note-dirs
      '("/home/john/jup/PrivateNotes"
	))

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

(defun jup-note-follow-link(note-timestamp)
  "Searches `jup-note-dir` for the specified note"
  (interactive)
  (debug)
  (message jup-note-dirs)
  (find-file (car jup-note-dirs))
  2)

;; Tests:
(jup-note-follow-link "20240110202130")


(defun jup-note-create-reference()
  "when you're in a note, this generates the [first-line](timestamp) string for you"
  )

(ert-deftest jup-note-get-first-path()
  (setq my-var (car jup-note-dirs)
  (should (eq my-var jup-note-dirs)))

(ert-deftest jup-note-follow-link-returns-something()
  (setq my-var (jup-note-follow-link "20240110202130"))
  (should (eq my-var 2)))


