;;; private/jazzpi/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :name "Meslo LG S DZ" :size 12 :weight 'light :width 'normal))

;; We want to be able to override the default bindings
(unless (featurep! +nobindings)
  (with-eval-after-load "config/default/+bindings" (load! +bindings)))

(after! which-key
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.0))

(setq +org-dir (expand-file-name "~/Documents/org"))

(setq +rust-src-dir (expand-file-name "~/dev/rust/"))
