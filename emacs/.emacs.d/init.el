(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
; direct backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)



(prefer-coding-system 'utf-8)
(electric-pair-mode 1)
(setq electric-pair-delete-pair t)
; (global-display-line-numbers-mode 1)
(global-hl-line-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; bring last session on start up
(desktop-save-mode 1)
(setq desktop-path (list "~/.emacs.d/desktop/"))
(set-frame-parameter nil 'fullscreen 'maximized)
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-everywhere t)



(use-package move-text)
(move-text-default-bindings)
(load-file "~/.emacs.d/duplicate-active-regions.el")
(global-set-key (kbd "M-S-<up>") 'duplicate-line-or-region-up)
(global-set-key (kbd "M-S-<down>") 'duplicate-line-or-region-down)
; overrides default C-z ('suspend-frame')
; (global-set-key (kbd "C-z") 'undo)
; overrides default C-d ('delete-char')
; (global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "C-;") 'comment-line)
; overrides default C-M-k ('kill-sexp-forward')
(use-package multiple-cursors
		:ensure t
		:config
		(global-set-key (kbd "C-M-k") 'mc/mark-all-dwim))



(use-package magit)



(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))



(setq prolog-system 'swi)
; open in prolog instead of perl
(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\)\\'" . prolog-mode))



(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms
      '(
        ("^.*[^/]\\(/[^/]*\\)$"
         "~/.emacs.d/autosaves/\\1"
         t
        )
      ))
(setq kept-new-versions 5)
(setq kept-old-versions 0)
(setq delete-old-versions t)
(make-directory "~/.emacs.d/backups/" t)
(make-directory "~/.emacs.d/autosaves/" t)
