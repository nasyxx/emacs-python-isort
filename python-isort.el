;;; nasy-python-isort.el --- Utility to sort Python imports -*- lexical-binding: t; -*-

(require 'reformatter)

(defcustom python-isort-command "isort"
  "Name of the `isort` executable."
  :group 'nasy
  :type 'string)

(defvar python-isort--base-args '("--quiet" "--atomic")
  "Base arguments to pass to isort.")

(defcustom python-isort-extra-args `("--sp" ,(expand-file-name "~/.config/isort.cfg"))
  "Extra arguments to pass to isort."
  :group 'nasy
  :type '(repeat string))

;;;###autoload (autoload 'python-isort-buffer "nasy-python-isort" nil t)
;;;###autoload (autoload 'python-isort-region "nasy-python-isort" nil t)
;;;###autoload (autoload 'python-isort-on-save-mode "nasy-python-isort" nil t)
(reformatter-define python-isort
  :program python-isort-command
  :args (python-isort--make-args beg end)
  :lighter " isort"
  :group 'python-isort)

(defun python-isort--make-args (beg end)
  "Helper to build the argument list for isort for span BEG to END."
  (append python-isort--base-args
          python-isort-extra-args
          '("-")))

(provide 'nasy-python-isort)
;;; nasy-python-isort.el ends here
