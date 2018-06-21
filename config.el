;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))

(setq doom-font (font-spec :name "Meslo LG S DZ" :size 12 :weight 'light :width 'normal))

(after! which-key
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.0))

(setq +org-dir (expand-file-name "~/Documents/org")
      ;+rust-src-dir (expand-file-name "~/dev/rust/")
      helm-move-to-line-cycle-in-source nil
      )

(with-eval-after-load "config/default/+bindings" (load! "+bindings"))

(setq +magit-hub-enable-by-default 't
      +magit-hub-features 't)
(after! magit
  (setq magithub-clone-default-directory "~/dev"
        magithub-preferred-remote-method 'ssh_url))

;; sft coding style
(defconst sft-c-style
  '("linux" ; base it on linux code style
    ; modified by jazzpi because smart tabs are a pain
    (indent-tabs-mode           . nil)
    ;(indent-tabs-mode           . t)
    (c-basic-offset             . 4)
    (c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . (
                                   (brace-list-open)
                                   (substatement-open after)
                                   ))
    (c-hanging-colons-alist     . (
                                   (access-label after)
                                   (case-label after)
                                   (inher-intro)
                                   (label after)
                                   (member-init-intro before)
                                   ))
    (c-cleanup-list             . (
                                   scope-operator
                                   empty-defun-braces
                                   defun-close-semi
                                   ))
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . (
                               (arglist-cont-nonempty)
                               (block-close . c-snug-do-while)
                               (brace-entry-open)
                               (brace-list-open)
                               (substatement-open before after)
                               ))
    (c-cleanup-list . (brace-else-brace))
    (c-offsets-alist . (
                                        ; arg indent helper funcs: c-lineup-{arglist[-tabs-only],argcont}
                                        ; arglist = indent to matching (|here, asdf
                                        ; argcont = indent to (asdf, |here
                                        ; absolute offset: [0]
                        (access-label          . -)   ; public: or private:
                        (arglist-intro         . +)   ; first arg in newline
                        (arglist-cont          . 0)   ; wrapped function args: func(\nthisone
                        (arglist-cont-nonempty . c-lineup-arglist)   ; wrapped function args after func(arg,\nthisone
                        (arglist-close         . 0)   ; intentation of ) which closes args
                        (block-open            . 0)   ; { to open a block
                        (block-close           . 0)   ; } after a block
                        (brace-list-intro      . +)   ; first element in {\nthisone
                        (brace-list-entry      . 0)   ; other elements in {\nelem\nthisone
                        (case-label            . 0)   ; case 1337:
                        (statement-case-open   . 0)   ; { after case 1337:
                        (statement-case-intro  . +)   ; code after case 1337:
                        (defun-block-intro     . +)   ; beginning of keyword (...) { stuff  }
                        (inclass               . +)   ; members of struct or class
                        (inher-cont            . c-lineup-multi-inher)   ; inheritance-continuation
                        (inline-open           . +)
                        (innamespace           . 0)   ; namespace lol {\nthisstatement
                        (knr-argdecl-intro     . -)
                        (knr-argdecl-intro     . 0)
                        (label                 . 0)   ; gotolabel:
                        (statement             . 0)
                        (statement-block-intro . +)   ; line in if () {\nthisline
                        (statement-case-open   . +)
                        (statement-cont        . (max c-lineup-assignments c-lineup-cascaded-calls c-lineup-string-cont))
                        (substatement          . +)
                        (substatement-label    . 0)
                        (substatement-open     . 0)
                        (substatement-open     . 0)
                        (topmost-intro         . 0)   ; indentation of file start
                        (topmost-intro-cont    . c-lineup-topmost-intro-cont)
                        (cpp-macro             . [0])   ; #define, etcetc
                        (member-init-intro     . +)   ; member initializing for class lol : var(val)
                        (member-init-cont      . c-lineup-multi-inher)   ; further members
                        ))

    ;; information about indent parsing on TAB
    ;; this is also triggered by C-c C-s
    (c-echo-syntactic-information-p . nil))
  "The SFT C programming style"
  )
(c-add-style "sft" sft-c-style)
