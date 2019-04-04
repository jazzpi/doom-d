;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :name "Meslo LG S DZ" :size 12 :weight 'light :width 'normal))
(defun jazzpi/theme-check ()
  "Load the theme from Xresources, then remove self from `focus-in-hook'.
Inspired by https://github.com/kaushalmodi/.emacs.d/blob/0284962584dbb26fc0dcfe9b9f28b6b63d29dd31/init.el#L375"
  (let ((x-resource-name "emacs"))
    (load-theme (intern (x-get-resource "theme" ""))))
  (remove-hook 'focus-in-hook #'jazzpi/theme-check))
(add-hook 'focus-in-hook #'jazzpi/theme-check)

;;; PACKAGE CONFIGURATION
(after! which-key
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.0))

(after! magit
  (setq magithub-clone-default-directory "~/dev"
        magithub-preferred-remote-method 'ssh_url))

(setq +org-dir (expand-file-name "~/Documents/org")
      ;+rust-src-dir (expand-file-name "~/dev/rust/")
      helm-move-to-line-cycle-in-source nil
      )

;; Evil doesn't really work in the terminal
(add-to-list 'evil-emacs-state-modes 'term-mode)

;;; MODULE CONFIGURATION
(with-eval-after-load "config/default/+evil-bindings" (load! "+bindings"))

;;; ROS CONFIGURATION
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))

;;; LANGUAGE CONFIGURATION

(add-hook! 'c-mode-common-hook (load! "lang/+c"))
