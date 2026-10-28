;; -*- lexical-binding: t; -*-
(setq warning-suppress-types
      (append warning-suppress-types
	      '((files missing-lexbind-cookie))))
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     t)
(package-initialize)
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") #'smex)
(global-set-key (kbd "M-X") #'smex-major-mode-commands)

(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-use-virtual-buffers t)
(setq custom-file (expand-file-name "~/dotfiles/emacs/emacs-custom.el"))
(load custom-file)

(load-theme 'gruber-darker t)
(setq aether-blue "#6368f8")
(set-face-foreground 'font-lock-builtin-face aether-blue)
(set-face-foreground 'font-lock-variable-name-face aether-blue)
(set-face-foreground 'font-lock-doc-face aether-blue)
(set-face-foreground 'font-lock-type-face aether-blue)
(set-face-foreground 'font-lock-constant-face aether-blue)
(set-face-foreground 'font-lock-preprocessor-face aether-blue)
(add-to-list 'default-frame-alist `(font . "Iosevka-18))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(delete-selection-mode 1)
(ido-mode 1)

(require 'move-text)
(move-text-default-bindings)

(add-hook 'prog-mode-hook #'indent-bars-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
