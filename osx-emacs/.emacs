;; color-theme
(require 'color-theme) 
(color-theme-gray30)

;; (set-background-color "gray70")

;; indent 
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(require 'show-wspace) ; Load this library.

;; load cedet
(load-file "/home/polo/src/cedet-1.0/common/cedet.el")
; Enable the Project management system
(global-ede-mode 1)
; Enable prototype help and smart completion
(semantic-load-enable-code-helpers)
; Enable template insertion menu
(global-srecode-minor-mode 1)

;; CC-mode config
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;; my c/c++ language strategy
(defun my-c-mode-common-hook()
  (setq tab-width 2 indent-tabs-mode nil)
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  
  ;; key config
  (define-key c-mode-base-map [(control \')] 'hs-toggle-hiding)
  ;; (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map [(meta \')] 'c-indent-command)
  ;; (define-key c-mode-base-map [(tab)] 'hippie-expand)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

  ;; preprocess config
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; my c++ language strategy
(defun my-c++-mode-hook()
  (setq tab-width 2 indent-tabs-mode nil)
  (c-set-style "stroustrup")
  ;; (define-key c++-mode-map [f3] 'replace-regexp)
)

;; config the Semantic search scope
(setq semanticdb-project-roots
  (list
    (expand-file-name "/")
  )
)

;; auto complete.
;; if in a word, call hippie-expand; if not, tab
(defun my-indent-or-complete()
  (interactive)
  (if (looking-at "\\>")
    (hippie-expand nil)
    (indent-for-tab-command)
  )
)

;; (global-set-key [(control tab)] 'my-indent-or-complete) 

(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-function-list
  '(
     senator-try-expand-semantic
     try-expand-dabbrev
     try-expand-dabbrev-visible
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     try-expand-list
     try-expand-list-all-buffers
     try-expand-line
     try-expand-line-all-buffers
     try-complete-file-name-partially
     try-complete-file-name
     try-expand-whole-kill
  )
)

;; cscope
(require 'xcscope)

;; speedbar
(global-set-key [(f12)] 'speedbar)

;; multi-gdb-ui
(load-file "/usr/share/emacs/22.2/lisp/multi-gdb-ui.el")

