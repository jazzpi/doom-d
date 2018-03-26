;;; private/jazzpi/autoloads.el -*- lexical-binding: t; -*-

;;;###autoload
(defun jazzpi/toggle-autocomplete ()
  "Toggle autocomplete by setting `company-idle-delay'"
  (interactive)
  (if company-idle-delay
      (setq company-idle-delay 0.2)
    (setq company-idle-delay nil)))

;;;###autoload
(defun spacemacs/alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the
current window."
  (interactive)
  (let ((current-buffer (window-buffer window))
        (buffer-predicate
         (frame-parameter (window-frame window) 'buffer-predicate)))
    ;; switch to first buffer previously shown in this window that matches
    ;; frame-parameter `buffer-predicate'
    (switch-to-buffer
     (or (cl-find-if (lambda (buffer)
                       (and (not (eq buffer current-buffer))
                            (or (null buffer-predicate)
                                (funcall buffer-predicate buffer))))
                     (mapcar #'car (window-prev-buffers window)))
         ;; `other-buffer' honors `buffer-predicate' so no need to filter
         (other-buffer current-buffer t)))))
