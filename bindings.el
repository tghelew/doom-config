;;; bindings.el -*- lexical-binding: t; -*-

;; Global mapping
(map!
 :n "M-f"
 (cond ((modulep! :completion vertico)   #'+default/search-buffer)
       ((modulep! :completion ivy)       #'swiper)
       ((modulep! :completion helm)      #'swiper))
 :n "M-F"
 (cond ((modulep! :completion vertico)   (cmd!! #'consult-line-multi 'all-buffers))
       ((modulep! :completion ivy)       #'swiper-all)
       ((modulep! :completion helm)      #'swiper-all)))

(when (modulep! :editor evil)
  (setq evil-escape-key-sequence "jk"))

