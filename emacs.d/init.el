(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(transient-mark-mode 1)
(setq default-directory "C:/Users/Admin/")
(global-display-line-numbers-mode)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(org-agenda-files '("~/test.org"))
 '(package-selected-packages
   '(almost-mono-themes flexoki-themes gruber-darker-theme move-text
			multiple-cursors ox-typst)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package ox-typst
  :after org)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)
(set-face-attribute 'default nil :font "Iosevka NF-20")

(add-to-list 'load-path "C:/Users/Admin/.emacs.d/autoload/")

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(fido-mode 1)
(setq auto-save-default nil)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(defun dupe-line()
  (interactive)
  (duplicate-line)
  (next-line 1)
  )
(global-set-key (kbd "C-,") 'dupe-line)
