;; Add MELPA to packages
(require 'package)
(add-to-list 'package-archives '("MELPA" . "http://melpa.org/packages/") t)
(package-initialize)

;; Spaces, not tabs
(setq-default indent-tabs-mode nil)

;; Disable menu bar
(menu-bar-mode -1) 

;; Enable Doom mode line
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-height 15)
(setq doom-modeline-icon t)

;; Set locs for autosave files
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/saves" t)))

;; Enable line numbering globally
(global-display-line-numbers-mode)

;; Enable auto-completion
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; Enable auto-complete mode globally
(global-auto-complete-mode t)
;; Set delay before suggestions appear
(setq ac-auto-show-menu 0.4)
;; Enable fuzzy matching
(setq ac-use-fuzzy t)
;; Add additional sources for completions
(add-to-list 'ac-sources 'ac-source-dictionary)
(add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
;; Customize popup menu appearance
(set-face-attribute 'ac-candidate-face nil :background "#1a1a1a" :foreground "white")
(set-face-attribute 'ac-selection-face nil :background "gold" :foreground "black")
;; Key-binding for auto-complete mode
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;Enable multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)

(custom-set-faces
 '(line-number ((t (:foreground "#5c6370" :background nil :slant italic))))
 '(line-number-current-line ((t (:foreground "gold" :background nil :weight bold))))
 '(mode-line ((t (:background "gold" :foreground "#1a1a1a" :weight bold :box nil))))
 '(mode-line-inactive ((t (:background "gold" :foreground "#1a1a1a" :box nil)))))
(custom-set-variables
 '(custom-enabled-themes `(dracula))
 '(custom-safe-themes
   '("c650a74280e8ce4ae4b50835b7a3bc62aeffa202ffea82260e529f0a69027696" default))
 '(package-selected-packages
   '(dracula-theme multiple-cursors moody doom-modeline auto-complete all-the-icons)))
(set-face-background 'default "unspecified-bg")

;; Set ToDo states and colors
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROG" "WAITING" "|" "DONE" "MIGRATED")))

(setq org-todo-keyword-faces
      '(("TODO" . "red") ("IN-PROG" . "orange")
        ("WAITING" . "yellow") ("DONE" . "green")("MIGRATED" . "light blue")))

;; Add appropriate key-bindings and files to org-agenda
(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-agenda-files '("~/Workflow/ToDo"))
