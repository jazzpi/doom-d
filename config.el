;;; private/jazzpi/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :name "Meslo LG S DZ" :size 12 :weight 'light :width 'normal))

(after! which-key
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.0))

(setq +org-dir (expand-file-name "~/Documents/org")
      +rust-src-dir (expand-file-name "~/dev/rust/"))

(unless (featurep! +nobindings)
  (with-eval-after-load "config/default/+bindings" (load! +bindings)))
