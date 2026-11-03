;; -*- lexical-binding: t; -*-
(setq warning-suppress-types
      (append warning-suppress-types
              '((files missing-lexbind-cookie))))

;; Load Package Archive
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
(package-initialize)

;; Packages
(require 'smex)
(smex-initialize)
(require 'eglot)

;; Smex
(global-set-key (kbd "M-x") #'smex)
(global-set-key (kbd "M-X") #'smex-major-mode-commands)

;; Functions
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-use-virtual-buffers t)

;; Custom-file for Generated Code
(setq custom-file (expand-file-name "~/dotfiles/emacs/emacs-custom.el"))
(load custom-file)

;; Style
(load-theme 'gruber-darker t)
(add-to-list 'default-frame-alist `(font . "Iosevka-16"))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(delete-selection-mode 1)
(ido-mode 1)

;; Convenience
(require 'move-text)
(move-text-default-bindings)
(add-hook 'prog-mode-hook #'indent-bars-mode)

;; C/C++ language server
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'c-mode-hook #'eglot-ensure)

;; Custom Colors
(setq white "#e2e1ee")
(setq aether-blue "#6368f8")
(setq muted-blue "#94a4c6")
(setq muted-pink "#e4a0a8")
(setq muted-green "#95a99f")
(setq muted-purple "#b4a1c8")

;; Types and constants
(set-face-foreground 'font-lock-type-face muted-green)
(set-face-foreground 'font-lock-constant-face aether-blue)

;; Variables
(set-face-foreground 'font-lock-variable-name-face muted-blue)
(set-face-foreground 'eglot-semantic-variable muted-blue)

;; Functions
(set-face-foreground 'font-lock-function-name-face muted-blue)
(set-face-foreground 'eglot-semantic-function muted-blue)

;; Symbols from the language server's default library
(set-face-foreground 'eglot-semantic-defaultLibrary muted-blue)

;; Classes
(set-face-foreground 'eglot-semantic-class aether-blue)

;; Enum types and members
(set-face-foreground 'eglot-semantic-enum muted-purple)
(set-face-foreground 'eglot-semantic-type muted-green)
(set-face-foreground 'eglot-semantic-enumMember muted-pink)

;; Eglot inlay hints (parameter names and inferred values)
(set-face-foreground 'eglot-inlay-hint-face muted-purple)
