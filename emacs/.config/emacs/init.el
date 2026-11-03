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
;; Font
(add-to-list 'default-frame-alist `(font . "Iosevka-18"))

;; Font Face Block
(setq aether-blue "#6368f8")

(set-face-foreground 'font-lock-function-name-face aether-blue)
(set-face-foreground 'font-lock-variable-name-face "#94a4c6")
(set-face-foreground 'font-lock-type-face aether-blue)
(set-face-foreground 'font-lock-builtin-face aether-blue)

;; Preprocessor and macros
(set-face-foreground 'font-lock-preprocessor-face "#e4a0a8")

;; Reset previous defaultLibrary customization
(face-spec-reset-face 'eglot-semantic-defaultLibrary)

(custom-set-faces
 ;; Variables
 '(eglot-semantic-variable
   ((t (:foreground "#94a4c6" :weight normal))))

 ;; Functions
 '(eglot-semantic-function
   ((t (:foreground "#6368f8" :weight normal))))

 ;; Operators
 '(eglot-semantic-operator
   ((t (:foreground "#e2e1ee" :weight normal))))

 ;; Struct fields and properties
 '(eglot-semantic-property
   ((t (:foreground "#95a99f" :weight normal))))

 ;; Classes and types
 '(eglot-semantic-class
   ((t (:foreground "#6368f8" :weight normal))))

 ;; Preserve the underlying token colour for declarations
 '(eglot-semantic-declaration
   ((t (:inherit nil))))

 '(eglot-semantic-definition
   ((t (:inherit nil))))

 ;; Enum members
 '(eglot-semantic-enumMember
   ((t (:inherit nil :foreground "#b4a1c8" :weight normal))))

 ;; Readonly modifier
 '(eglot-semantic-readonly
   ((t (:inherit nil))))

 ;; Inlay hints
 '(eglot-parameter-hint-face
   ((t (:inherit eglot-inlay-hint-face
        :foreground "#b4a1c8"))))

 '(eglot-inlay-hint-face
   ((t (:foreground "#b4a1c8" :height 1.0))))
 )


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
