;; Turn off some unneeded UI elements
(menu-bar-mode -1) 

;; Globally display line numbers
(global-display-line-numbers-mode 1)

;; Set line number colors
(set-face-foreground 'line-number "#D4AF37")
(set-face-foreground 'line-number-current-line "#FFFFFF")

;; Set ToDo states and colors
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROG" "WAITING" "|" "DONE")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("IN-PROG" . "orange")
        ("WAITING" . "yellow")))

;; Add appropriate key-bindings and files to org-agenda
(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-agenda-files '("~/Workflow/ToDo"))

;; Save all emacs auto-saves in spec dir 
(setq backup-directory-alist
      `((".*" . "~/.auto-save")))
(setq auto-save-file-name-transforms
      `((".*" "~/.auto-save" t)))

;; Add MELPA to list of package archives
(require 'package)
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.org/packages/"))
(package-initialize)

;; Add and load Github Dark theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'github-dark-vscode t)

;;Remove theme background
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
