;; Add MELPA to packages
;;-------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("MELPA" . "http://melpa.org/packages/") t)
(package-initialize)

;; Spaces, not tabs
;;-------------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Disable menu bar
;;-------------------------------------------------------------------------
(menu-bar-mode -1) 

;; Enable Doom mode line
;;-------------------------------------------------------------------------
(require 'doom-modeline)
(doom-modeline-mode 1)
;; Set the height of the mode line
(setq doom-modeline-height 15)
;; Enable icons (require 'all-the-icons' package)
(setq doom-modeline-icon t)

;; Set locs for autosave files
;;-------------------------------------------------------------------------
;; Ensure the autosave directory exists
(unless (file-exists-p "~/.emacs.d/autosaves")
  (make-directory "~/.emacs.d/autosaves"))

;; Set the auto-save file location for files ending with ~
(setq auto-save-file-name-transforms
      `((".*~" "~/.emacs.d/autosaves/" t)))

;; Enable line numbering globally
;;-------------------------------------------------------------------------
(global-display-line-numbers-mode)

;; Enable auto-completion
;;-------------------------------------------------------------------------
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

;; Use keybindings to switch themes
;;-------------------------------------------------------------------------
;; Load the solarized-theme package
(load-theme 'solarized-light t)
;; Define a function to swith to solarized-light 
(defun switch-to-solarized-light ()
      (interactive)
      (load-theme 'solarized-light t)
      (set-face-background 'default "unspecified-bg"))
;; Set a key binding to switch to solarized-light
(global-set-key (kbd "C-c s l") 'switch-to-solarized-light)

;; Define a function to swith to dracula
(defun switch-to-dracula ()
      (interactive)
      (load-theme 'dracula t)
      (set-face-background 'default "unspecified-bg"))
;; Set a key binding to switch to dracula
(global-set-key (kbd "C-c d r") 'switch-to-dracula)

;;Enable multiple cursors
;;-------------------------------------------------------------------------
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)

;; Customize appearance
;;-------------------------------------------------------------------------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:foreground "#5c6370" :background nil :slant italic))))
 '(line-number-current-line ((t (:foreground "gold" :background nil :weight bold))))
 '(mode-line ((t (:background "gold" :foreground "black" :weight bold :box nil))))
 '(mode-line-inactive ((t (:background "gold" :foreground "black" :box nil)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes `(dracula))
 '(custom-safe-themes
   '("a8e721dc14961b37d513b53f5f688c39f5d20b86a2e1f6142eb6c730f2ddd86f"
     "11819dd7a24f40a766c0b632d11f60aaf520cf96bd6d8f35bae3399880937970"
     default))
 '(package-selected-packages
   '(highlight-indent-guides solarized-theme typescript-mode
                             dracula-theme multiple-cursors moody
                             doom-modeline auto-complete all-the-icons)))
;; Remove bg by defuault
(set-face-background 'default "unspecified-bg")

;; Allow toggling whitespace mode
;;-------------------------------------------------------------------------
(defun toggle-whitespace-mode ()
      (interactive)
      (whitespace-mode 'toggle))
(global-set-key (kbd "C-x C-w") 'toggle-whitespace-mode)


;; Set todo states and colors
;;-------------------------------------------------------------------------
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROG" "WAITING" "|" "DONE" "MIGRATED")))

(setq org-todo-keyword-faces
      '(("TODO" . "red") ("IN-PROG" . "orange")
        ("WAITING" . "yellow") ("DONE" . "green")("MIGRATED" . "light blue")))

;; Add org-agenda keybindings
(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-agenda-files '("~/Workflow/ToDo"))
