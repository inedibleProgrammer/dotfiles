;; -*- lexical-binding: t; -*-
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq custom-file (expand-file-name "custom-file.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(global-set-key (kbd "<f5>") 'recompile)
(global-set-key (kbd "<f6>") 'jn-follow-link)

;; (load "~/.emacs.d/jup.el")

(setq next-screen-context-lines 15)
(global-display-line-numbers-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(set-frame-font "monospace 12")

(setq c-default-style "bsd")
(setq-default indent-tabs-mode nil)
;; (indent-tabs-mode -1)
(setq c-basic-offset 4)
(add-hook 'c-mode 'indent-tabs-mode)



