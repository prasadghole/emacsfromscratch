;; Do not show the startup screen.
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(recentf-mode 1)

;; Stop creating lots of backup files
(setq backup-inhibited t)
;;Remember command history
(setq history-length 25)
(savehist-mode 1)

;;last visited file position
(save-place-mode 1)

;;Auto revert to changed file outside of emacs
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(line-number-mode +1)
(global-display-line-numbers-mode +1)



(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;escape menu 
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;helm keybinding
(global-set-key (kbd "M-x") 'helm-M-x)
;; Highlight current line.
(global-hl-line-mode t)

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

(use-package company
  :config
  (setq company-idle-delay 0))

(add-hook 'after-init-hook 'global-company-mode)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
   (setq load-prefer-newer t);; Additional packages and their configurations

(use-package all-the-icons
  :if (display-graphic-p))

(use-package nerd-icons
  :ensure t
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package counsel
  :config
  (counsel-mode 1)) ;;Enable to use counsel keybinding overried emacs


(use-package helm
  :bind
  ("C-x C-f" . 'helm-find-files)
  ("C-x C-b" . 'helm-buffer-list)
  :config
  (require 'helm-autoloads)
  (helm-mode 1))

;; (use-package ivy
;;   :bind 
;;   :config
;;   (ivy-mode 1)
;;   (setq ivy-initial-inputs-alist nil)
;;   )

;; (use-package ivy-rich
;;   :init
;;   (ivy-rich-mode 1))

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

(use-package which-key
  :defer nil
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer)
  :bind (:map ibuffer-mode-map
              ("j" . evil-next-line)
              ("k" . evil-previous-line)
              ("J" . ibuffer-forward-line)
              ("K" . ibuffer-backward-line)
              ("/" . evil-search-forward)
              ("?" . evil-search-backward))
  :config
  ;; Customize ibuffer's appearance and behavior here
  )



(use-package perspective
  :bind
  ("C-x C-p" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

;;Org package starts from here
(use-package org
  :ensure t
  :init
  (setq org-directory "~/org")
  :config
  (setq org-startup-indented t)
  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil)
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

(use-package flyspell
  :config
  (setq ispell-program-name "hunspell")
  )

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1))
(use-package emacsql
  :defer nil)
(use-package emacsql-sqlite
  :after emacsql
  :defer nil)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "d:/Prasad/roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package ox-pandoc)

(use-package ox-reveal)

(use-package org-download
  :ensure t
  :config
  (setq org-download-method 'directory)
  (setq org-download-image-dir  "d:/Prasad/roam/images")
  (org-download-enable))

(use-package mermaid-mode
  :ensure t
  :mode ("\\.mmd\\'" . mermaid-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)))

(use-package ob-async)

;;ysnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets)

