;;; email.el -*- lexical-binding: t; -*-
;;; mu4e + mbsync + mu
(set-email-account! "tghelew"
  '((mu4e-sent-folder       . "/thierry@ghelew.ch/Sent")
    (mu4e-drafts-folder     . "/thierry@ghelew.ch/Drafts")
    (mu4e-trash-folder      . "/thierry@ghelew.ch/Trash")
    (mu4e-refile-folder     . "/thierry@ghelew.ch/Archive")
    (user-mail-address      . "thierry@ghelew.ch")    ;; only needed for mu < 1.4
    (mu4e-compose-signature . "---\nThanks & Regards\nThierry Ghelew")
    (+mu4e-personal-addresses . ("thierry@ghelew.net"
                                 "thierry@ghelew.ch"
                                 "joes@ghelew.ch"
                                 "joes@ghelew.net"
                                 "trash_1@ghelew.ch"
                                 "travel@ghelew.net"
                                 "subscription@ghelew.net"
                                 "postmaster@ghelew.ch")))
  t)

(set-email-account! "lux"
  '((mu4e-sent-folder       . "/tlux@ghelew.ch/Sent")
    (mu4e-drafts-folder     . "/tlux@ghelew.ch/Drafts")
    (mu4e-trash-folder      . "/tlux@ghelew.ch/Trash")
    (mu4e-refile-folder     . "/tlux@ghelew.ch/Archive")
    (user-mail-address      . "thierrry@ghelew.ch")    ;; only needed for mu < 1.4
    (mu4e-compose-signature . "---\nThanks & Regards\nTlux (Thierry on *nix)"))
  t)

(after! mu4e
  (setq mu4e-context-policy 'ask-if-none
        mu4e-compose-context-policy 'always-ask
        mu4e-get-mail-command
          (concat "mbsync --all"
                  (when-let (file (file-exists-p! "isyncrc" (or (concat (getenv "XDG_CONFIG_HOME") "/isync") "~/.config/isync")))
                    (format " --config %S" file))))

  (setq sendmail-program "/usr/local/bin/msmtp"
      send-mail-function 'smtpmail-send-it
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail))
; (add-to-list 'mu4e-bookmarks
;  '(`(concat "maildir:/" user-mail-address "/Inbox") "Inbox maildir" ?i) t)
