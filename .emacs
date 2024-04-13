;; Do not show the startup screen.
(setq inhibit-startup-message t)
(setq org-ellipsis "⤵")
(line-number-mode +1)
(global-display-line-numbers-mode +1)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)
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
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
   (setq load-prefer-newer t);; Additional packages and their configurations

(use-package spacemacs-theme
  :ensure t
  :config
  ;; Do not use a different background color for comments.
  (setq spacemacs-theme-comment-bg nil)

  ;; Comments should appear in italics.
  (setq spacemacs-theme-comment-italic t)

  ;; Use the `spacemacs-dark` theme.
  (load-theme 'spacemacs-dark))




(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )

(use-package org
  :ensure t
  :init
  (setq org-directory "~/org")
  :config
  (setq org-startup-indented t)
  (setq org-src-fontify-natively t)
  )

(use-package diff-hl
  :config
  (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))
 
(use-package magit
  :bind
  ("C-x g" . magit-status)

  :config
  (use-package evil-collection)
  (setq magit-push-always-verify nil)
  (setq git-commit-symmary-max-length 50)
  )
