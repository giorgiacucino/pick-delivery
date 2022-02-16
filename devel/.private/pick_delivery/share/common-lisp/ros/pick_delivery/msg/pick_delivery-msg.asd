
(cl:in-package :asdf)

(defsystem "pick_delivery-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "c_to_s" :depends-on ("_package_c_to_s"))
    (:file "_package_c_to_s" :depends-on ("_package"))
    (:file "s_to_c" :depends-on ("_package_s_to_c"))
    (:file "_package_s_to_c" :depends-on ("_package"))
  ))