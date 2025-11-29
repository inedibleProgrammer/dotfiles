# Ensure that the script's context is its own directory
cd "$(dirname "${0}")"

emacs -batch -l ert \
      -l jup-test-helper.el \
      -l test/test-jup-note.el \
      -f ert-run-tests-batch-and-exit
