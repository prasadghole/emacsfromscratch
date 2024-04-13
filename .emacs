;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Highlight current line.
(global-hl-line-mode t)

;; Use `command` as `meta` in macOS.
(setq mac-command-modifier 'meta)

;; Do not use `init.el` for `custom-*` code - use `custom-file.el`.
(setq custom-file "~/.emacs.d/custom-file.el")

;; Assuming that the code in custom-file is execute before the code
;; ahead of this line is not a safe assumption. So load this file
;; proactively.
(load-file custom-file)

;; Require and initialize `package`.
(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


;; Additional packages and their configurations

(use-package spacemacs-theme
  :ensure t
  :config
  ;; Do not use a different background color for comments.
  (setq spacemacs-theme-comment-bg nil)

  ;; Comments should appear in italics.
  (setq spacemacs-theme-comment-italic t)

  ;; Use the `spacemacs-dark` theme.
  (load-theme 'spacemacs-dark))

(use-package company
  :ensure t
  ;; Navigate in completion minibuffer with `C-n` and `C-p`.
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  ;; Provide instant autocompletion.
  (setq company-idle-delay 0.1)

  ;; Use company mode everywhere.
  (global-company-mode t))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )

