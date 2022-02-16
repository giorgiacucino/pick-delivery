;; Auto-generated. Do not edit!


(when (boundp 'pick_delivery::invio)
  (if (not (find-package "PICK_DELIVERY"))
    (make-package "PICK_DELIVERY"))
  (shadow 'invio (find-package "PICK_DELIVERY")))
(unless (find-package "PICK_DELIVERY::INVIO")
  (make-package "PICK_DELIVERY::INVIO"))
(unless (find-package "PICK_DELIVERY::INVIOREQUEST")
  (make-package "PICK_DELIVERY::INVIOREQUEST"))
(unless (find-package "PICK_DELIVERY::INVIORESPONSE")
  (make-package "PICK_DELIVERY::INVIORESPONSE"))

(in-package "ROS")





(defclass pick_delivery::invioRequest
  :super ros::object
  :slots (_sender _aula _receiver ))

(defmethod pick_delivery::invioRequest
  (:init
   (&key
    ((:sender __sender) "")
    ((:aula __aula) "")
    ((:receiver __receiver) "")
    )
   (send-super :init)
   (setq _sender (string __sender))
   (setq _aula (string __aula))
   (setq _receiver (string __receiver))
   self)
  (:sender
   (&optional __sender)
   (if __sender (setq _sender __sender)) _sender)
  (:aula
   (&optional __aula)
   (if __aula (setq _aula __aula)) _aula)
  (:receiver
   (&optional __receiver)
   (if __receiver (setq _receiver __receiver)) _receiver)
  (:serialization-length
   ()
   (+
    ;; string _sender
    4 (length _sender)
    ;; string _aula
    4 (length _aula)
    ;; string _receiver
    4 (length _receiver)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sender
       (write-long (length _sender) s) (princ _sender s)
     ;; string _aula
       (write-long (length _aula) s) (princ _aula s)
     ;; string _receiver
       (write-long (length _receiver) s) (princ _receiver s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sender
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sender (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _aula
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _aula (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _receiver
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _receiver (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pick_delivery::invioResponse
  :super ros::object
  :slots (_serv_resp ))

(defmethod pick_delivery::invioResponse
  (:init
   (&key
    ((:serv_resp __serv_resp) 0)
    )
   (send-super :init)
   (setq _serv_resp (round __serv_resp))
   self)
  (:serv_resp
   (&optional __serv_resp)
   (if __serv_resp (setq _serv_resp __serv_resp)) _serv_resp)
  (:serialization-length
   ()
   (+
    ;; int64 _serv_resp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _serv_resp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _serv_resp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _serv_resp) (= (length (_serv_resp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_serv_resp . bv) 0) 0) s)
              (write-long (ash (elt (_serv_resp . bv) 1) -1) s))
             ((and (class _serv_resp) (= (length (_serv_resp . bv)) 1)) ;; big1
              (write-long (elt (_serv_resp . bv) 0) s)
              (write-long (if (>= _serv_resp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _serv_resp s)(write-long (if (>= _serv_resp 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _serv_resp
#+(or :alpha :irix6 :x86_64)
      (setf _serv_resp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _serv_resp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass pick_delivery::invio
  :super ros::object
  :slots ())

(setf (get pick_delivery::invio :md5sum-) "71b5c4d20a9c9adce22eff539e04418e")
(setf (get pick_delivery::invio :datatype-) "pick_delivery/invio")
(setf (get pick_delivery::invio :request) pick_delivery::invioRequest)
(setf (get pick_delivery::invio :response) pick_delivery::invioResponse)

(defmethod pick_delivery::invioRequest
  (:response () (instance pick_delivery::invioResponse :init)))

(setf (get pick_delivery::invioRequest :md5sum-) "71b5c4d20a9c9adce22eff539e04418e")
(setf (get pick_delivery::invioRequest :datatype-) "pick_delivery/invioRequest")
(setf (get pick_delivery::invioRequest :definition-)
      "string sender
string aula
string receiver
---
int64 serv_resp
")

(setf (get pick_delivery::invioResponse :md5sum-) "71b5c4d20a9c9adce22eff539e04418e")
(setf (get pick_delivery::invioResponse :datatype-) "pick_delivery/invioResponse")
(setf (get pick_delivery::invioResponse :definition-)
      "string sender
string aula
string receiver
---
int64 serv_resp
")



(provide :pick_delivery/invio "71b5c4d20a9c9adce22eff539e04418e")


