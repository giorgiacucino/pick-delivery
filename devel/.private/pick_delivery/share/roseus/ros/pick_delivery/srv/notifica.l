;; Auto-generated. Do not edit!


(when (boundp 'pick_delivery::notifica)
  (if (not (find-package "PICK_DELIVERY"))
    (make-package "PICK_DELIVERY"))
  (shadow 'notifica (find-package "PICK_DELIVERY")))
(unless (find-package "PICK_DELIVERY::NOTIFICA")
  (make-package "PICK_DELIVERY::NOTIFICA"))
(unless (find-package "PICK_DELIVERY::NOTIFICAREQUEST")
  (make-package "PICK_DELIVERY::NOTIFICAREQUEST"))
(unless (find-package "PICK_DELIVERY::NOTIFICARESPONSE")
  (make-package "PICK_DELIVERY::NOTIFICARESPONSE"))

(in-package "ROS")





(defclass pick_delivery::notificaRequest
  :super ros::object
  :slots (_user _auladest _msg ))

(defmethod pick_delivery::notificaRequest
  (:init
   (&key
    ((:user __user) "")
    ((:auladest __auladest) "")
    ((:msg __msg) "")
    )
   (send-super :init)
   (setq _user (string __user))
   (setq _auladest (string __auladest))
   (setq _msg (string __msg))
   self)
  (:user
   (&optional __user)
   (if __user (setq _user __user)) _user)
  (:auladest
   (&optional __auladest)
   (if __auladest (setq _auladest __auladest)) _auladest)
  (:msg
   (&optional __msg)
   (if __msg (setq _msg __msg)) _msg)
  (:serialization-length
   ()
   (+
    ;; string _user
    4 (length _user)
    ;; string _auladest
    4 (length _auladest)
    ;; string _msg
    4 (length _msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _user
       (write-long (length _user) s) (princ _user s)
     ;; string _auladest
       (write-long (length _auladest) s) (princ _auladest s)
     ;; string _msg
       (write-long (length _msg) s) (princ _msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _user
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _user (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _auladest
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _auladest (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pick_delivery::notificaResponse
  :super ros::object
  :slots (_picked ))

(defmethod pick_delivery::notificaResponse
  (:init
   (&key
    ((:picked __picked) 0)
    )
   (send-super :init)
   (setq _picked (round __picked))
   self)
  (:picked
   (&optional __picked)
   (if __picked (setq _picked __picked)) _picked)
  (:serialization-length
   ()
   (+
    ;; int64 _picked
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _picked
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _picked (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _picked) (= (length (_picked . bv)) 2)) ;; bignum
              (write-long (ash (elt (_picked . bv) 0) 0) s)
              (write-long (ash (elt (_picked . bv) 1) -1) s))
             ((and (class _picked) (= (length (_picked . bv)) 1)) ;; big1
              (write-long (elt (_picked . bv) 0) s)
              (write-long (if (>= _picked 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _picked s)(write-long (if (>= _picked 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _picked
#+(or :alpha :irix6 :x86_64)
      (setf _picked (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _picked (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass pick_delivery::notifica
  :super ros::object
  :slots ())

(setf (get pick_delivery::notifica :md5sum-) "b3820e35b2fce1d8d4821fc34321f691")
(setf (get pick_delivery::notifica :datatype-) "pick_delivery/notifica")
(setf (get pick_delivery::notifica :request) pick_delivery::notificaRequest)
(setf (get pick_delivery::notifica :response) pick_delivery::notificaResponse)

(defmethod pick_delivery::notificaRequest
  (:response () (instance pick_delivery::notificaResponse :init)))

(setf (get pick_delivery::notificaRequest :md5sum-) "b3820e35b2fce1d8d4821fc34321f691")
(setf (get pick_delivery::notificaRequest :datatype-) "pick_delivery/notificaRequest")
(setf (get pick_delivery::notificaRequest :definition-)
      "string user
string auladest
string msg
---
int64 picked
")

(setf (get pick_delivery::notificaResponse :md5sum-) "b3820e35b2fce1d8d4821fc34321f691")
(setf (get pick_delivery::notificaResponse :datatype-) "pick_delivery/notificaResponse")
(setf (get pick_delivery::notificaResponse :definition-)
      "string user
string auladest
string msg
---
int64 picked
")



(provide :pick_delivery/notifica "b3820e35b2fce1d8d4821fc34321f691")


