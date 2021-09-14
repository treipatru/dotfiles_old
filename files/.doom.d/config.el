;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name ""
      user-mail-address "")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrains Mono" :size 17)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-spacegrey)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Runs eslint fix on save
;; depends of global npm package eslint_d
(add-hook 'js2-mode-hook #'eslintd-fix-mode)


;; Auto refresh magit
(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))

;; Ask to switch workspace buffer when opening split
(setq evil-vsplit-window-right t
      evil-split-window-below t)
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-workspace-buffer))





;; -----------------------------------------------------------------------------
;; MODELINE
;;

;; We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case
(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
                                 '(coding-category-undecided coding-category-utf-8))
                           (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
                t)))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Shorten status line file path
(setq doom-modeline-buffer-file-name-style 'truncate-with-project)

;; Longer branch names
(setq doom-modeline-vcs-max-length 32)





;; -----------------------------------------------------------------------------
;; MISC
;;

;; Disable projectile caching to make sure we're always up to date
(setq projectile-enable-caching nil)

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      truncate-string-ellipsis "…")               ; Truncate with unicode ellispis

(setq scroll-margin 10)
(setq hscroll-margin 40)

;; Current line background color
(global-hl-line-mode)
(set-face-background hl-line-face "grey24" )

(setq +ivy-buffer-preview t)

;; Don't move the cursor one character back when exiting insert mode
(setq evil-move-cursor-back nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(after! rustic
  (setq rustic-format-on-save t)
  (setq lsp-rust-server 'rust-analyzer))

;; Window opacity
(set-frame-parameter (selected-frame) 'alpha '(97 . 97))
(add-to-list 'default-frame-alist '(alpha . (97 . 97)))

;; Org settings
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-agenda-files '("~/org"))
(setq +org-capture-todo-file '("~/todos.org"))
