(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((ssh-deploy-script lambda nil
      (let
          ((default-directory ssh-deploy-root-remote))
        (shell-command "make all")))
     (ssh-deploy-on-explicit-save)
     (+upload-root-remotes
      ("eshua" . "/ssh:thierry@eshua.ghelew.ch:/home/thierry/temail")
      ("eshub" . "/ssh:thierry@eshub.ghelew.ch:/home/thierry/temail")
      ("eshuc" . "/ssh:thierry@eshuc.ghelew.ch:/home/thierry/temail"))))
 '(smtpmail-smtp-server "smtp.ghelew.ch")
 '(smtpmail-smtp-service 587))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
