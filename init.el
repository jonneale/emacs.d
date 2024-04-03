(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)

(tool-bar-mode -1)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

(set-face-attribute 'default nil :family "Source Code Pro" :height 150)

(windmove-default-keybindings)

(global-set-key (kbd "M-3") (lambda () (interactive) (insert "#")))



(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :config (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(pdf-tools exec-path-from-shell cider clojure-mode auto-complete paredit org-bullets all-the-icons-dired all-the-icons vscode-dark-plus-theme which-key try use-package))
 '(safe-local-variable-values
   '((ffip-patterns "*.org" "*.rb" "*.sh" "*.md" "*.css" "*.scss" "Rakefile" "Procfile" "Capfile" "*.sql" "*.json" "*.haml" "*.js")
     (ffip-find-options . "-not -regex \".*out-.*\""))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  :bind (("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly))
  :diminish nil)

(setq mac-option-key-is-meta t
      mac-command-key-is-meta nil
      mac-command-key-is-super t
      mac-command-modifier 'super
      mac-option-modifier 'meta)

(define-key global-map [?\s-z] nil)
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
     
(global-set-key [f7] 'toggle-fullscreen)

(use-package auto-complete
  :ensure t
  :init (progn (ac-config-default)
	       (global-auto-complete-mode t)))

(use-package exec-path-from-shell)

(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell))

(when (daemonp)
  (exec-path-from-shell-initialize))


(add-to-list 'load-path "<path-to-lsp-bridge>")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)

;; share killring between OSX and emacs
(setq save-interprogram-paste-before-kill 't)
(setq x-select-enable-clipboard 't)
