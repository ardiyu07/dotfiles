;; path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/emacs-w3m-1.4.4")
(add-to-list 'load-path "~/.emacs.d/emacs-window-layout")
(add-to-list 'load-path "~/.emacs.d/emacs-window-manager")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/region-bindings-mode")
(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el")
(add-to-list 'load-path "~/.emacs.d/coffee-mode")

(defun e2wm-doc-max ()
  (interactive)
  (e2wm:dp-doc)
  (e2wm:dp-doc-main-maximize-toggle-command)
  )

;; multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-c w") 'kill-rectangle)
(global-set-key (kbd "C-c y") 'yank-rectangle)
(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C-c j") 'mc/reverse-regions)

;; C-u ARG C-c i for insert-numbers from ARG
(global-set-key (kbd "C-c i") 'mc/insert-numbers)

(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c g") 'keyboard-quit)
(global-set-key (kbd "C-c g") 'mc/keyboard-quit)
;; Sixth mode -- doc mode after maximizing the window
(global-set-key (kbd "C-c ; 6") 'e2wm-doc-max)

;; region-binding mode                                      
(add-to-list 'load-path "/folder/containing/file")
(require 'region-bindings-mode)
(region-bindings-mode-enable)

(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)

;; swift-mode for iOS
(autoload 'swift-mode "swift-mode.el" "Swift mode." t)
(require 'swift-mode)

;; go-mode for iOS
(autoload 'go-mode "go-mode.el" "Go mode." t)
(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; csharp-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.cshtml$" . csharp-mode)) auto-mode-alist))


;; llvm mode
(autoload 'llvm-mode "llvm-mode.el" "LLVM mode." t)
(require 'llvm-mode)
(require 'tablegen-mode)

;; php-mode
(autoload 'php-mode "php-mode.el" "PHP mode." t)
(require 'php-mode)

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; ruby-mode
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; ts-mode
(autoload 'ts-mode "ts-mode.el" "TS mode." t)
(require 'ts-mode)
(add-to-list 'auto-mode-alist '("\\.ts$" . ts-mode))

;; css-mode
(add-hook 'css-mode-hook
          (lambda ()
            (setq css-indent-offset 2)
            ))
;; scss-mode
(autoload 'scss-mode "scss-mode.el" "SCSS mode." t)
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . scss-mode))

;; rspec-mode
(require 'rspec-mode)

;; rails-mode
(setq load-path (cons (expand-file-name "~/.emacs.d/emacs-rails-reloaded") load-path))
(require 'rails-autoload)
(setq ruby-indent-level 4)

;; rhtml-mode
(setq load-path (cons (expand-file-name "~/.emacs.d/rhtml") load-path))
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

;; interactively do things
(require 'ido)
(ido-mode t)

;; rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

;; cmake-mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;; coffee-script mode and keybindings
(require 'coffee-mode)
(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace
(global-set-key (kbd "C-c r") 'coffee-compile-region)
(global-set-key (kbd "C-c f") 'coffee-compile-file)
(global-set-key (kbd "C-c c") 'coffee-repl)

;; c++-mode
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cl$" . c++-mode))

;; conf-mode
(add-to-list 'auto-mode-alist '("Doxyfile$" . conf-mode))

;; backspace-cygwin
(normal-erase-is-backspace-mode 0)

;; key-binding
(global-set-key (kbd "C-c b") 'comment-box)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-w") 'delete-region)

(global-set-key (kbd "C-x o") 'comment-region)
(global-set-key (kbd "C-x p") 'uncomment-region)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-x w") 'replace-string)

(global-set-key (kbd "C-x s") 'shell)
(global-set-key (kbd "C-x c") 'compile)

(global-set-key (kbd "C-c C-i") 'indent-relative)

;; linum
(require 'linum+)
(global-set-key (kbd "<f5>") 'linum-mode)

;; for usound only
(global-set-key (kbd "C-c o") (lambda ()(interactive) 
				  (compile "cd ~/usound/branches/yuri_work/ ; ./bootstrap_gcc.sh ; cd ~/usound/branches/yuri_work.build/ ; make")))
(global-set-key (kbd "C-c p") (lambda ()(interactive) 
				  (compile "cd ~/usound/branches/yuri_work.build/ ; make clean")))

;; start new shell                                                                     
(defun start-another-shell ()
  "Start new shell with new name"
  (interactive)
  (setq shell-name "*shell*")
  (if (get-buffer shell-name)
      (progn
        (switch-to-buffer shell-name)
        (rename-buffer (generate-new-buffer-name shell-name))))
  (shell))

(defun shell-change-dir ()
  "Open shell to default dir"
  (interactive)
  (setq cur-dir default-directory)
  (setq shell-name "*shell*")
  (shell shell-name)
  (switch-to-buffer shell-name)
  (cd cur-dir)
  (comint-send-string (current-buffer) (concat "cd " cur-dir "\r"))
)

(global-set-key (kbd "C-c x") 'shell-change-dir)

;; Set encoding
(global-set-key (kbd "C-c e") 'set-buffer-file-coding-system)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; windows manager
(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)
(global-set-key (kbd "M-_") 'e2wm:stop-management)

;; emacs-w3m
(require 'w3m-load)
(provide 'w3m-e23)

;; emacs tags bindings
(global-set-key (kbd "M-.") 'find-tag)
(global-set-key (kbd "M-,") 'tags-apropos)

;; cscope : finds method for c/c++ and java
(require 'xcscope)
(setq cscope-do-not-update-database t)
(global-set-key (kbd "C-c s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-c u") 'cscope-pop-mark)

;; doxygen
(require 'doxymacs)

(defun my-c-mode-common-hook ()
 (c-set-offset 'substatement-open 0)
 (c-set-offset 'brace-list-open 0)

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 )

;; Never use tabs!!
(setq-default indent-tabs-mode nil)

;; indent all
(global-set-key (kbd "C-c a") (lambda ()
                                (interactive)
                                (indent-region (point-min) (point-max))
                                ))                    

;; Load windows manager as soon as emacs loads
(eval-after-load "e2wm" 
  '(progn
     (e2wm:start-management)
     (e2wm:dp-doc)
     )
  )

;; Needed for emacs on several linux os
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
   "Set `ansi-color-for-comint-mode' to t." t)

;; Hooks for c mode
;; (require 'hideif)
;; (add-hook 'c++-mode-hook
;;     '(lambda ()
;;        (hide-ifdef-mode t)
;;        (setq hide-ifdef-shadow t)
;;        (hide-ifdefs)
;;     ))

(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-hook (lambda () (setq comment-start "/*"
                                          comment-end "*/")))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((require-final-newline)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Auto revert editing
;; When the file is modified by an external program (including another emacs)
(global-auto-revert-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Insert tab character
(global-set-key (kbd "<backtab>") (lambda() (interactive) (insert-char 9 1)))

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; The sky is the limit
(tool-bar-mode 0)
(menu-bar-mode 0)

;; White on Black
;; (custom-set-faces
;;   '(default ((t (:background "black" :foreground "grey"))))
;;   '(fringe ((t (:background "black")))))
