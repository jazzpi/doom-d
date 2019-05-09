;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :name "Meslo LG S DZ" :size 12 :weight 'light :width 'normal))

(after! which-key
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.0))

(setq +org-dir (expand-file-name "~/Documents/org")
      ;+rust-src-dir (expand-file-name "~/dev/rust/")
      helm-move-to-line-cycle-in-source nil
      )

(with-eval-after-load "config/default/+evil-bindings" (load! "+bindings"))

;; Evil doesn't really work in the terminal
(add-to-list 'evil-emacs-state-modes 'term-mode)

;; (setq +magit-hub-enable-by-default 't
;;       +magit-hub-features 't)
(after! magit
  (setq magithub-clone-default-directory "~/dev"
        magithub-preferred-remote-method 'ssh_url))

(add-hook! 'c-mode-common-hook (load! "lang/+c"))
