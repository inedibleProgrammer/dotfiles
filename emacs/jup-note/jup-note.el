;;; -*- lexical-binding: t -*-
(require 'thingatpt)

(defgroup jup-note nil
  "My custom note-taking system."
  :group 'tools)

(defcustom jn-search-dirs '("~/jup/PrivateNotes"
                            "~/jup/PrivateNotes/Life"
                            "~/jup/PrivateNotes/Technical"
                            )
  "List of directories to search for note timestamps."
  :type '(repeat directory)
  :group 'jup-note)

;; [dummy](20210510162958)
(defun jn-follow-link(&optional env)
  "Follow the link at point."
  (interactive "P")
  (let* (
        (dirs      (or (plist-get env :search-dirs) jn-search-dirs))
        (word-fn   (or (plist-get env :word)   #'word-at-point))
        (exists-fn (or (plist-get env :exists) #'file-exists-p))
        (open-fn   (or (plist-get env :open)   #'find-file))
        (timestamp (or (plist-get env :timestamp) (funcall word-fn)))
        (found nil)
        )
    (when timestamp
      (dolist (dir dirs)
        (let ((full-path (expand-file-name (concat timestamp "/README.md") dir)))
          (if (funcall exists-fn full-path)
              (progn
                (setq found t)
                (funcall open-fn full-path))))))
    (if found
        t
      nil)
  ))



(provide 'jup-note)
