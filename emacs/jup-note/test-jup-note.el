;;; -*- lexical-binding: t -*-

(require 'ert)
(require 'jup-note)

(ert-deftest test-dummy()
  (should (eq 1 1))
  )

(ert-deftest test-jn-follow-link-returns-nil()
  (let* (
        (timestamp "20240303090030")
        (mock-env (list
                   :open-fn t
                   :word (lambda () timestamp)
                   )
                  )
        )
    (setq result (jn-follow-link mock-env))
    (should (eq result nil))
    )
  )

(ert-deftest test-jn-follow-link-returns-true()
  (let* (
        (timestamp "20240303090030")
        (mock-env (list
                   :open-fn t
                   :word (lambda () timestamp)
                   :search-dirs '("/tmp/dir1")
                   :exists (lambda (path) t)
                   :open-fn t
                   )
                  )
        )
    (setq result (jn-follow-link mock-env))
    (should (eq result t))
    )
  )


(ert-deftest test-jn-search-logic ()
  (let* ((timestamp "20240303090030")
         (checked-paths '())
         (mock-env (list
                    :open-fn t
                    :word (lambda () timestamp)
                    ;; MOCK the search directories here!
                    :search-dirs '("/tmp/mock-a" "/tmp/mock-b")
                    ;; Capture what the function tries to check
                    :exists (lambda (path) 
                              (push path checked-paths)
                              nil)))) ; Pretend nothing exists

    (jn-follow-link mock-env)

    ;; Verify the function tried to look in our MOCKED dirs, 
    ;; not the real ~/notes folders.
    (should (member "/tmp/mock-b/20240303090030/README.md" checked-paths))
    (should (member "/tmp/mock-a/20240303090030/README.md" checked-paths))))
