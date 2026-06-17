(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(badwolf-theme company dap-mode dirvish drag-stuff flycheck go-mode
				   helm-lsp helm-xref lsp-ui lua-mode magit
				   multiple-cursors projectile termint
				   treemacs-all-the-icons typescript-mode vterm-toggle
				   yasnippet))
 '(tab-width 4))

;; Custom visual configurations
(load-theme 'badwolf t)
(setq inhibit-startup-message t
	  visible-bell t)
(global-display-line-numbers-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Tabline visuals
(global-tab-line-mode 1)

;; Adds pairs to (), []. {}, "", '', ``
(electric-pair-mode 1)
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\' . ?\')
        (?\{ . ?\})
		(?\` . ?\`)
        (?\[ . ?\])
		(?\( . ?\))
		)
	  )
(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

; Custom Theming
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

;; Select multiple
(use-package multiple-cursors
  :ensure t
  :bind (("C-d" . mc/mark-next-like-this)
         ("C-c C-c" . mc/edit-lines)))

;Disable for a while until treemacs is completely implemented
;(use-package treemacs)
;(use-package treemacs-all-the-icons:ensure t)

; Internal terminal
; The bind should be mapped depending on the used keyboard
(use-package vterm
  :ensure t
  :config
  (setq vterm-buffer-name "vterm")
  )

(use-package vterm-toggle
  :ensure t
  :bind (("C-`" . vterm-toggle)
		 :map vterm-mode-map
		 ("C-`" . vterm-toggle))
  )
(setq vterm-toggle-fullscreen-p nil)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                (reusable-frames . visible)
                (window-height . 0.3)))

;; Git manager package
(use-package magit :ensure t)

; Install necessary packages for LSP
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

; LSP configs for C, Typescript, Python, Lua, C++ and Go
(use-package go-mode :ensure t)
(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")
(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . tsx-mode))
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
  )

(use-package lsp-mode
  :ensure t
  :demand t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
		 (c-mode             . lsp-deferred)
		 (cpp-mode           . lsp-deferred)
		 (python-mode        . lsp-deferred)
		 (lua-mode           . lsp-deferred)
		 (go-mode            . lsp-deferred)
		 (typescript-mode    . lsp-deferred)
		 (tsx-mode           . lsp-deferred)
		 (typescript-ts-mode . lsp-deferred)
		 (lsp-mode           . lsp-enable-which-key-integration)
		 )
  :config
  (setq read-process-output-max (* 1024 1024))
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-sideline-enable t)
  )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
