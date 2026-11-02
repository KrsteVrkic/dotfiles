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
(require 'eglot)

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

(set-face-foreground 'font-lock-function-name-face aether-blue)
(set-face-foreground 'font-lock-variable-name-face "#94a4c6")

;; Preprocessor and macros: muted pink
(set-face-foreground 'font-lock-preprocessor-face "#e4a0a8")

;; Font
(add-to-list 'default-frame-alist `(font . "Iosevka-18"))

;; Eglot semantic highlighting
(custom-set-faces
 '(eglot-semantic-variable
   ((t (:foreground "#94a4c6" :weight normal))))
 '(eglot-semantic-function
  ((t (:foreground "#6368f8" :weight normal))))

 '(eglot-semantic-property
   ((t (:foreground "#95a99f" :weight normal))))

 ;; Prevent declarations and definitions inheriting function colours
 '(eglot-semantic-declaration
   ((t (:inherit nil))))

 '(eglot-semantic-definition
   ((t (:inherit nil))))

 ;; Enum members: muted purple
 '(eglot-semantic-enumMember
   ((t (:inherit nil :foreground "#b4a1c8" :weight normal))))

 ;; Remove inherited constant colouring from readonly tokens
 '(eglot-semantic-readonly
   ((t (:inherit nil))))

 '(eglot-parameter-hint-face
  ((t (:inherit eglot-inlay-hint-face
		:foreground "#b4a1c8"))))
 '(eglot-inlay-hint-face
   ((t (:foreground "#b4a1c8" :height 1.0))))
 ;; Macros inherit the pink preprocessor colour
)

;; Remove the defaultLibrary face override
(face-spec-reset-face 'eglot-semantic-defaultLibrary)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(delete-selection-mode 1)
(ido-mode 1)

(require 'move-text)
(move-text-default-bindings)

(add-hook 'prog-mode-hook #'indent-bars-mode)

;; C/C++ language server
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'c-mode-hook #'eglot-ensure)
