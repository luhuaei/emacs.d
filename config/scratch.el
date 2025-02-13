(defun increment-numbers-in-region (start end)
  "Increment all numbers in the selected region by 1."
  (interactive "r")
  (save-excursion
    (goto-char start)
    (while (re-search-forward "[0-9]+" end t)
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))))
