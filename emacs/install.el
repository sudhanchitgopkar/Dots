;; Adding MELPA to packages
;;-------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Define all packages to install
;;-------------------------------------------------------------------------
(defvar my-packages
  '(typescript-mode
    dracula-theme
    solarized-theme
    multiple-cursors
    moody
    doom-modeline
    auto-complete
    all-the-icons))

;; Install any missing packages
;;-------------------------------------------------------------------------
(defun install-missing-packages ()
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-missing-packages)
