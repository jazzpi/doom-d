;;; ~/.doom.d/lang/+latex.el -*- lexical-binding: t; -*-

(add-to-list
 'TeX-command-list
 '("LaTeXMk (with rc file)"
   "latexmk -f"
   TeX-run-command
   nil ; ask for confirmation
   t ; active in all modes
   :help "Run latexmk without any arguments (probably requires a latexmkrc file)"))
(after! hl-todo
  (add-to-list 'hl-todo-keyword-faces
               '("\\todo" warning bold)))
(hl-todo-mode)
