;;; ~/.doom.d/lang/+org.el -*- lexical-binding: t; -*-

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("koma-article" "\\documentclass{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(setq org-latex-listings 'minted
      org-latex-minted-options '(("frame" "single") ("breaklines"))
      org-latex-default-figure-position "H"
      org-latex-pdf-process
      (mapcar (lambda (s)
                (replace-regexp-in-string "%latex " "%latex -shell-escape " s))
              org-latex-pdf-process))

; see https://emacs.stackexchange.com/a/77575/15775
(after! org-download
      (setq org-download-method 'directory)
      (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
      (setq org-download-image-org-width 600)
      (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
      (setq org-download-link-format-function #'org-download-link-format-function-default))

; see https://emacs.stackexchange.com/a/19941/15775
;; (defun jazzpi/minted-options (text backend info)
;;   "Add options to minted environment"
;;   (when (org-export-derived-backend-p backend 'latex)
;;     (with-temp-buffer
;;       (insert text)
;;       ;; replace {minted}[ by {minted}[frame=single,breaklines
;;       (goto-char (point-min))
;;       (replace-string "\\begin{minted}[" "\\begin{minted}[frame=single,breaklines")
;;       (buffer-substring-no-properties (point-min) (point-max)))))
;; (add-to-list 'org-export-filter-src-block-functions
;;              'jazzpi/minted-options)
