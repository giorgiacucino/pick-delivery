
(cl:in-package :asdf)

(defsystem "pick_delivery-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "invio" :depends-on ("_package_invio"))
    (:file "_package_invio" :depends-on ("_package"))
    (:file "login" :depends-on ("_package_login"))
    (:file "_package_login" :depends-on ("_package"))
  ))