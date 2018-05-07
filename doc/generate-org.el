(defun generate-org-from-org (org-file)
  "Generate Org file from Org file template."
  (interactive "f")
  (progn
    (find-file org-file)
    (org-org-export-to-org)
    )
  )
