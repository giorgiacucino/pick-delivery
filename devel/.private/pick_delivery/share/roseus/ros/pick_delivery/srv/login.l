;; Auto-generated. Do not edit!


(when (boundp 'pick_delivery::login)
  (if (not (find-package "PICK_DELIVERY"))
    (make-package "PICK_DELIVERY"))
  (shadow 'login (find-package "PICK_DELIVERY")))
(unless (find-package "PICK_DELIVERY::LOGIN")
  (make-package "PICK_DELIVERY::LOGIN"))
(unless (find-package "PICK_DELIVERY::LOGINREQUEST")
  (make-package "PICK_DELIVERY::LOGINREQUEST"))
(unless (find-package "PICK_DELIVERY::LOGINRESPONSE")
  (make-package "PICK_DELIVERY::LOGINRESPONSE"))

(in-package "ROS")





(defclass pick_delivery::loginRequest
  :super ros::object
  :slots (_name _aula _type_service ))

(defmethod pick_delivery::loginRequest
  (:init
   (&key
    ((:name __name) "")
    ((:aula __aula) "")
    ((:type_service __type_service) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _aula (string __aula))
   (setq _type_service (round __type_service))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:aula
   (&optional __aula)
   (if __aula (setq _aula __aula)) _aula)
  (:type_service
   (&optional __type_service)
   (if __type_service (setq _type_service __type_service)) _type_service)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _aula
    4 (length _aula)
    ;; int64 _type_service
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _aula
       (write-long (length _aula) s) (princ _aula s)
     ;; int64 _type_service
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _type_service (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _type_service) (= (length (_type_service . bv)) 2)) ;; bignum
              (write-long (ash (elt (_type_service . bv) 0) 0) s)
              (write-long (ash (elt (_type_service . bv) 1) -1) s))
             ((and (class _type_service) (= (length (_type_service . bv)) 1)) ;; big1
              (write-long (elt (_type_service . bv) 0) s)
              (write-long (if (>= _type_service 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _type_service s)(write-long (if (>= _type_service 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _aula
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _aula (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _type_service
#+(or :alpha :irix6 :x86_64)
      (setf _type_service (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _type_service (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass pick_delivery::loginResponse
  :super ros::object
  :slots (_serv_resp ))

(defmethod pick_delivery::loginResponse
  (:init
   (&key
    ((:serv_resp __serv_resp) "")
    )
   (send-super :init)
   (setq _serv_resp (string __serv_resp))
   self)
  (:serv_resp
   (&optional __serv_resp)
   (if __serv_resp (setq _serv_resp __serv_resp)) _serv_resp)
  (:serialization-length
   ()
   (+
    ;; string _serv_resp
    4 (length _serv_resp)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _serv_resp
       (write-long (length _serv_resp) s) (princ _serv_resp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _serv_resp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _serv_resp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pick_delivery::login
  :super ros::object
  :slots ())

(setf (get pick_delivery::login :md5sum-) "f832b245f80447f012d2bc11a8aa30b1")
(setf (get pick_delivery::login :datatype-) "pick_delivery/login")
(setf (get pick_delivery::login :request) pick_delivery::loginRequest)
(setf (get pick_delivery::login :response) pick_delivery::loginResponse)

(defmethod pick_delivery::loginRequest
  (:response () (instance pick_delivery::loginResponse :init)))

(setf (get pick_delivery::loginRequest :md5sum-) "f832b245f80447f012d2bc11a8aa30b1")
(setf (get pick_delivery::loginRequest :datatype-) "pick_delivery/loginRequest")
(setf (get pick_delivery::loginRequest :definition-)
      "string name
string aula
int64 type_service
---
string serv_resp
")

(setf (get pick_delivery::loginResponse :md5sum-) "f832b245f80447f012d2bc11a8aa30b1")
(setf (get pick_delivery::loginResponse :datatype-) "pick_delivery/loginResponse")
(setf (get pick_delivery::loginResponse :definition-)
      "string name
string aula
int64 type_service
---
string serv_resp
")



(provide :pick_delivery/login "f832b245f80447f012d2bc11a8aa30b1")


