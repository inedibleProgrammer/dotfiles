;;; -*- lexical-binding: t -*-

(require 'ert)

; These are more like categories
(defvar jup-note-dirs
  '("/home/john/jup/PrivateNotes/Bible"
    "/home/john/jup/PrivateNotes/Life"
    "/home/john/jup/PrivateNotes/Technical"
	))

(defvar jup-note-dir-privatenotes "/home/john/jup/PrivateNotes/")
(defvar jup-note-dir-technical "/home/john/jup/PrivateNotes/Technical")
(defvar jup-note-emacs-notes-timestamp "20240110202130")

(defvar jup-note-find-file 'find-file)

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
  (jup-note-follow-link (word-at-point)))

(defun jup-note-follow-link(note-timestamp)
  "Searches `jup-note-dir` for the specified note"
  (interactive)
  (let ((note-found nil)
	(dir nil)
	(dirlist nil)
	(note-dirs jup-note-dirs)
	(readme nil))
    (while (not note-found)
      (setq dir (car note-dirs))
      (setq dirlist (directory-files dir))
      (debug)
      (setq readme (jup-note-get-readme-from-dir-and-timestamp dir dirlist note-timestamp))
      (if (readme)
	  (progn
	    (setq note-found t)))
      (setq note-dirs (cdr note-dirs))))
    (find-file readme))
      

;;   ;; Uncomment these to pass the test:
;;   ;; (setq my-dir (concat jup-note-dir "Technical/20240110202130/README.md"))
;;   ;; (find-file my-dir)
;;     )
;;   )

;; "manual" Integration Test:
;; (jup-note-follow-link "20240110202130")


(defun jup-note-create-reference()
  "When you're in a note, this generates the `[first-line](timestamp)` string for you"
  )

(defun jup-note-get-readme-from-dir-and-timestamp(category dirlist timestamp)
  (let ((readme-found nil)
	(readme-path nil)
	(dir nil)
	(readme-dir nil)
	(dir-slash nil))
    ;; (debug)
    (while (not readme-found)
      (setq dir (car dirlist))
      (if (string-equal dir timestamp)
	  (progn
	    (setq readme-found t)
	    (setq dir-slash (concat "/" dir))
	    (setq readme-dir (concat category dir-slash))
	    (setq readme-path (concat readme-dir "/README.md")))
	    ;; (debug))
	(setq dirlist (cdr dirlist))))
    readme-path))


(ert-deftest test-jup-note-follow-link-lands-correctly()
  "Wide integration test of jup-note-follow-link"
  (setq expect (concat jup-note-dir "Technical/20240110202130/README.md"))
  (save-excursion
    ;; This is the emacs notes note
    (jup-note-follow-link "20240110202130")
    (should (string-equal (buffer-file-name) expect))))

(ert-deftest test-jup-note-get-readme-from-dir-and-timestamp()
  (let ((dir (directory-files jup-note-dir-technical))
	(note jup-note-emacs-notes-timestamp))
    ;; (debug)
    (setq readme (jup-note-get-readme-from-dir-and-timestamp jup-note-dir-technical dir note))
    (should (string-equal readme "/home/john/jup/PrivateNotes/Technical/20240110202130/README.md"))
    )
  )





;; (ert-deftest test-jup-note-

;; (ert-deftest jup-note-reads-something()
;;   ;; Return value of (directory-files-and-attributes "/home/john/jup/PrivateNotes")
;;   (setq dir-data '(("." t 1 1000 1000 (26835 47600 18496 771000) (26872 43575 776432 984000) (26872 43575 776432 984000) 82 "drwxr-xr-x" t 85390 ...) (".." t 1 1000 1000 (26830 60953 155898 283000) (26881 16036 171689 120000) (26881 16036 171689 120000) 136 "drwxr-xr-x" t 11987 ...) (".git" t 1 1000 1000 (26835 47600 18496 771000) (26881 23943 714016 80000) (26881 23943 714016 80000) 188 "drwxr-xr-x" t 85391 ...) (".gitignore" nil 1 1000 1000 (26835 47602 736516 331000) (26835 47602 736516 331000) (26835 47602 736516 331000) 13 "-rw-r--r--" t 85468 ...) ("Bible" t 1 1000 1000 (26835 47602 736516 331000) (26835 47602 745516 396000) (26835 47602 745516 396000) 700 "drwxr-xr-x" t 85469 ...) ("Life" t 1 1000 1000 (26835 47602 745516 396000) (26872 43575 776432 984000) (26872 43575 776432 984000) 2632 "drwxr-xr-x" t 85525 ...) ("README.md" nil 1 1000 1000 (26872 43575 776432 984000) (26872 43575 776432 984000) (26872 43575 776432 984000) 721 "-rw-r--r--" t 284932 ...) ("Technical" t 1 1000 1000 (26835 47602 809272 844000) (26872 43575 776432 984000) (26872 43575 776432 984000) 9302 "drwxr-xr-x" t 85725 ...)))

  
  
;;   )


;; (ert-deftest jup-note-get-first-path()
;;   (setq my-var (car jup-note-dirs)
;;   (should (eq my-var jup-note-dirs))))

  ;; (debug)
  ;; (message jup-note-dirs)
  ;; (find-file (car jup-note-dirs))
  ;; (funcall jup-note-find-file (car jup-note-dirs))

      ;; (message note)
      ;; (if (string-equal note note-timestamp)
      ;; 	  (progn
      ;; 	    (message "found it")
      ;; 	    (setq dir-path (expand-file-name dir))
      ;; 	    (setq note-dir (concat dir-path note))
      ;; 	    (setq readme (concat note-dir "/README.md"))
      ;; 		  (message readme)
      ;; 	    (find-file readme)))
