(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)


(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)


(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))


;; (global-display-line-numbers-mode)
;; (setq display-line-numbers 'relative)

(setq-default display-line-numbers-type 'visual)
(global-display-line-numbers-mode)


(set-frame-font "Cascadia Code 12" nil t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-soft))
 '(custom-safe-themes
   '("2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default))
 '(package-selected-packages '(eglot gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
