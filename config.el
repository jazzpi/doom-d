;;; private/jazzpi/config.el -*- lexical-binding: t; -*-

(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))

(setq doom-font (font-spec :name "Meslo LG S DZ" :size 12 :weight 'light :width 'normal))

(after! which-key
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.0))

(setq +org-dir (expand-file-name "~/Documents/org")
      ;+rust-src-dir (expand-file-name "~/dev/rust/")
      helm-move-to-line-cycle-in-source nil
      )

(unless (featurep! +nobindings)
  (with-eval-after-load "config/default/+bindings" (load! +bindings)))

(def-package! exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(def-package! magithub
  :after magit
  :config
  (magithub-feature-autoinject t)
  (setq magithub-clone-default-directory "~/dev"
        magithub-preferred-remote-method 'ssh_url))
