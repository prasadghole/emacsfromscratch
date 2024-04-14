;; Do not show the startup screen.
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(recentf-mode 1)
;;Remember command history
(setq history-length 25)
(savehist-mode 1)

;;last visited file position
(save-place-mode 1)

;;Auto revert to changed file outside of emacs
(global-auto-revert-mode 1)

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

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

;; (use-package spacemacs-theme
;;   :ensure t
;;   :config
;;   ;; Do not use a different background color for comments.
;;   (setq spacemacs-theme-comment-bg nil)

;;   ;; Comments should appear in italics.
;;   (setq spacemacs-theme-comment-italic t)

;;   ;; Use the `spacemacs-dark` theme.
;;   (load-theme 'spacemacs-dark))


(use-package evil
  :ensure t
  :config
  (evil-mode 1)
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

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1)
  )


(use-package org
  :ensure t
  :init
  (setq org-directory "~/org")
  :config
  (setq org-startup-indented t)
  (setq org-src-fontify-natively t)
  )
(use-package org-indent
  :ensure nil
  :diminish
  :custom
  (org-indent-indentation-per-level 4)
  (org-log-into-drawer t)
  )

(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-hide-leading-stars t)

(setq org-use-speed-commands t)

(use-package which-key
  :defer nil
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package emacsql
  :defer nil)
(use-package emacsql-sqlite
  :after emacsql
  :defer nil)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "d:/Prasad/WinRoam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))
