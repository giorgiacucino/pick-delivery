;; Auto-generated. Do not edit!


(when (boundp 'pick_delivery::c_to_s)
  (if (not (find-package "PICK_DELIVERY"))
    (make-package "PICK_DELIVERY"))
  (shadow 'c_to_s (find-package "PICK_DELIVERY")))
(unless (find-package "PICK_DELIVERY::C_TO_S")
  (make-package "PICK_DELIVERY::C_TO_S"))

(in-package "ROS")
;;//! \htmlinclude c_to_s.msg.html


(defclass pick_delivery::c_to_s
  :super ros::object
  :slots (_sender _receiver _auladest ))

(defmethod pick_delivery::c_to_s
  (:init
   (&key
    ((:sender __sender) "")
    ((:receiver __receiver) "")
    ((:auladest __auladest) "")
    )
   (send-super :init)
   (setq _sender (string __sender))
   (setq _receiver (string __receiver))
   (setq _auladest (string __auladest))
   self)
  (:sender
   (&optional __sender)
   (if __sender (setq _sender __sender)) _sender)
  (:receiver
   (&optional __receiver)
   (if __receiver (setq _receiver __receiver)) _receiver)
  (:auladest
   (&optional __auladest)
   (if __auladest (setq _auladest __auladest)) _auladest)
  (:serialization-length
   ()
   (+
    ;; string _sender
    4 (length _sender)
    ;; string _receiver
    4 (length _receiver)
    ;; string _auladest
    4 (length _auladest)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sender
       (write-long (length _sender) s) (princ _sender s)
     ;; string _receiver
       (write-long (length _receiver) s) (princ _receiver s)
     ;; string _auladest
       (write-long (length _auladest) s) (princ _auladest s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sender
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sender (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _receiver
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _receiver (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _auladest
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _auladest (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get pick_delivery::c_to_s :md5sum-) "1edfb1960ffea85e363609983abdaaf3")
(setf (get pick_delivery::c_to_s :datatype-) "pick_delivery/c_to_s")
(setf (get pick_delivery::c_to_s :definition-)
      "string sender
string receiver
string auladest
")



(provide :pick_delivery/c_to_s "1edfb1960ffea85e363609983abdaaf3")


