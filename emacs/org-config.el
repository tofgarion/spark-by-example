(require 'org)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(require 'ox-org)

; function to create Org INCLUDE directive from Ada function/procedure
; specification or body. You must be inside the
; function/procedure. Regexps are used to recompute the begin/end
; lines (cf. A. Malarbaba's functions further)
(setq tof/ada-ads-end-function-regexp "\\s-*(\\([^()]*?\\(?:\\n[^()]*\\)*?\\)*)\\s-*\\([^;]*?\\(?:\\n[^;]*\\)*?\\)*;")

(defun tof/create-org-include-from-ada-function ()
  "This function allows to get a Org #+INCLUDE directive from the
Ada function or procedure in which the point is. The directive is
copied in the kill ring."
  (interactive)
  (save-excursion
    (let* ((filename (file-name-nondirectory buffer-file-name))
           (buffer-major-mode (symbol-name major-mode)))
      (progn
        (search-backward-regexp "\\(\\(?:function\\|procedure\\) \\([^ ]*\\)\\).*$")
        (save-match-data
          (setq first-line (line-number-at-pos))
          (setq begin-regexp (match-string 1))
          (setq function-name (match-string 2))
          )
        (setq end-regexp
              (if (string= (file-name-extension filename) "ads")
                  tof/ada-ads-end-function-regexp
                (concat "End " function-name ";")
                  ))
        (search-forward-regexp end-regexp nil nil 1)
        (setq last-line (+ (line-number-at-pos) 1))
        (with-temp-buffer
          (insert "\t#+INCLUDE: \"" filename
                  "\" :src " (substring buffer-major-mode 0 (- (length buffer-major-mode) 5))
                  " :range-begin " (concat "\"" (string-trim begin-regexp) "\"")
                  " :range-end " (concat "\"" end-regexp "\"")
                  " :lines \"" (int-to-string first-line)
                  "-" (int-to-string last-line) "\"\n")
          (copy-region-as-kill (point-min) (point-max))
          )
        )
      )
    )
  )

; function to view code included by #+INCLUDE directive
(defun tof/org-babel-preview-include ()
  "Open a preview buffer with code source as defined by an #+INCLUDE directive"
  (interactive)
  (let* ((value (org-element-property :value (org-element-at-point)))
	 (ind (org-get-indentation))
	 location
	 (file
	  (and (string-match
	        "^\\(\".+?\"\\|\\S-+\\)\\(?:\\s-+\\|$\\)" value)
	       (save-match-data
	         (let ((matched (match-string 1 value)))
	           (when (string-match "\\(::\\(.*?\\)\\)\"?\\'"
				       matched)
		     (setq location (match-string 2 matched))
		     (setq matched
		      (replace-match "" nil nil matched 1)))
	           (expand-file-name
		    (org-unbracket-string "\"" "\"" matched)
		    ".")))
	       ))
	 (lang
          (and (string-match ":src +\\([^ ]*\\)" value)
               (match-string 1 value)))
	 (lines
	  (and (string-match
		":lines +\"\\(\\([0-9]+\\)-\\([0-9]+\\)\\)\""
		value)
	       (match-string 1 value)
	       ))
         (first-line (and lines (string-to-number (match-string 2 value))))
         (last-line (and lines (string-to-number (match-string 3 value))))
         (buffer (get-buffer-create (make-temp-name "org-include-view-"))))
    (progn
      (org-switch-to-buffer-other-window buffer)
      (insert-file-contents-literally file nil)
      (funcall (intern (concat lang "-mode")))
      (goto-char (point-min))
      (if first-line
          (let* ((p1 (prog2
                         (forward-line (- first-line 1))
                         (point)))
                 (p2 (prog2
                         (forward-line (- last-line first-line))
                         (point))))
            (narrow-to-region p1 p2)
            (goto-char (point-min))
            )
        )
      )
    )
  )

; functions to verify line numbers in #+INCLUDE directive using
; begin/end regexps. Thanks to Artur Malabarba
; (cf. http://endlessparentheses.com/updating-org-mode-include-statements-on-the-fly.html)
(defun endless/update-includes (&rest ignore)
  "Update the line numbers of #+INCLUDE:s in current buffer.
Only looks at INCLUDEs that have either :range-begin
or :range-end.  This function does nothing if not in org-mode, so
you can safely add it to `before-save-hook'."
  (interactive)
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp
              "^\\s-*#\\+INCLUDE: *\"\\([^\"]+\\)\".*:range-\\(begin\\|end\\)"
              nil 'noerror)
        (let* ((file (expand-file-name (match-string-no-properties 1)))
               lines begin end)
          (forward-line 0)
          (when (looking-at "^.*:range-begin *\"\\([^\"]+\\)\"")
            (setq begin (match-string-no-properties 1)))
          (when (looking-at "^.*:range-end *\"\\([^\"]+\\)\"")
            (setq end (match-string-no-properties 1)))
          (setq lines (endless/decide-line-range file begin end))
          (when lines
            (if (looking-at ".*:lines *\"\\([-0-9]+\\)\"")
                (replace-match lines :fixedcase :literal nil 1)
              (goto-char (line-end-position))
              (insert " :lines \"" lines "\""))))))))

(defun endless/decide-line-range (file begin end)
  "Visit FILE and decide which lines to include.
BEGIN and END are regexps which define the line range to use."
  (let (l r)
    (save-match-data
      (with-temp-buffer
        (insert-file file)
        (goto-char (point-min))
        (if (null begin)
            (setq l "")
          (search-forward-regexp begin)
          (setq l (line-number-at-pos (match-beginning 0))))
        (if (null end)
            (setq r "")
          (search-forward-regexp end)
          (setq r (1+ (line-number-at-pos (match-end 0)))))
        (format "%s-%s" l r)))))
