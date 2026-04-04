# Ensure that the script's context is its own directory
cd "$(dirname "${0}")"


emacs -batch \
      -L . \
      -l ert \
      -l test-jup-note.el \
      -f ert-run-tests-batch-and-exit
