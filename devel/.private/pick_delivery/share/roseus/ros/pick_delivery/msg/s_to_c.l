;; Auto-generated. Do not edit!


(when (boundp 'pick_delivery::s_to_c)
  (if (not (find-package "PICK_DELIVERY"))
    (make-package "PICK_DELIVERY"))
  (shadow 's_to_c (find-package "PICK_DELIVERY")))
(unless (find-package "PICK_DELIVERY::S_TO_C")
  (make-package "PICK_DELIVERY::S_TO_C"))

(in-package "ROS")
;;//! \htmlinclude s_to_c.msg.html


(defclass pick_delivery::s_to_c
  :super ros::object
  :slots (_user _auladest _msg _pd ))

(defmethod pick_delivery::s_to_c
  (:init
   (&key
    ((:user __user) "")
    ((:auladest __auladest) "")
    ((:msg __msg) "")
    ((:pd __pd) 0)
    )
   (send-super :init)
   (setq _user (string __user))
   (setq _auladest (string __auladest))
   (setq _msg (string __msg))
   (setq _pd (round __pd))
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
  (:pd
   (&optional __pd)
   (if __pd (setq _pd __pd)) _pd)
  (:serialization-length
   ()
   (+
    ;; string _user
    4 (length _user)
    ;; string _auladest
    4 (length _auladest)
    ;; string _msg
    4 (length _msg)
    ;; int64 _pd
    8
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
     ;; int64 _pd
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _pd (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _pd) (= (length (_pd . bv)) 2)) ;; bignum
              (write-long (ash (elt (_pd . bv) 0) 0) s)
              (write-long (ash (elt (_pd . bv) 1) -1) s))
             ((and (class _pd) (= (length (_pd . bv)) 1)) ;; big1
              (write-long (elt (_pd . bv) 0) s)
              (write-long (if (>= _pd 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _pd s)(write-long (if (>= _pd 0) 0 #xffffffff) s)))
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
   ;; int64 _pd
#+(or :alpha :irix6 :x86_64)
      (setf _pd (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _pd (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get pick_delivery::s_to_c :md5sum-) "4026358b2d8ac7d89ae115170c802353")
(setf (get pick_delivery::s_to_c :datatype-) "pick_delivery/s_to_c")
(setf (get pick_delivery::s_to_c :definition-)
      "string user
string auladest
string msg
int64 pd
")



(provide :pick_delivery/s_to_c "4026358b2d8ac7d89ae115170c802353")


