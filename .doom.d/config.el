;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ===================================================
;;
;;  Configurações Doom Emacs - David de Oliveira Lima
;;  Última atualização: 14 / 04 / 2022
;;
;; ===================================================


;; =========================
;;           Geral
;; =========================

(setq user-full-name    "David Lima"
      user-mail-address "dipias2002@gmail.com")

(setq org-directory "~/org/")

;; Funcionalidade
(cua-mode 1)
(evil-mode 0)
;; (ido-mode 1)
(dynamic-completion-mode 1)
;; (ido-everywhere 1)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (forward-line 1)
  (yank)
)

;; Aparencia
(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "Hack" :size 15 :weight 'regular))
;;(setq doom-font (font-spec :family "Hack Nerd Font" :size 15 :weight 'regular))
(setq display-line-numbers-type t)
(doom/set-frame-opacity 98)
(tool-bar-mode 0)
(display-battery-mode 1)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq-default cursor-type 'bar)


;; ==================================
;;  Atalhos de Teclado / Keybindings
;; ==================================

;; Geral
(global-set-key (kbd "C-;") 'comment-region)
(global-set-key (kbd "<f1><f2>") 'compile)
(global-set-key (kbd "<f2><f1>") 'kill-compilation)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-decrease)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-d") '+treemacs/toggle)
(global-set-key (kbd "C-M-<down>")  'duplicate-line)
(global-set-key (kbd "C-S-s")  '+default/search-project)

;; Packages
(global-set-key (kbd "C-ç g") 'magit)
(global-set-key (kbd "C-S-d") 'treemacs)
(global-set-key (kbd "C-,") 'lsp-ui-imenu)


;; =========================
;;         Pacotes
;; =========================

;; multiple-cursors
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; lsp-mode
(require 'lsp)

(setq gc-cons-threshold 100000000)

(use-package! lsp-mode
  :config
  (add-hook 'c++-mode-hook #'lsp)
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))

  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'rust-mode-hook #'lsp)
  (add-hook 'csharp-mode-hook #'lsp))

;; simpc
(add-hook 'simpc-mode-hook
           (lambda ()
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
                    ;; emulate make's .c.o implicit pattern rule, but with
                    ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                    ;; variables:
                    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
              (format "g++ %s -o %s.out && ./%s.out"
                      file
                              (file-name-sans-extension file)
                              (file-name-sans-extension file)))))))

(provide 'config)
;;; config.el ends here
