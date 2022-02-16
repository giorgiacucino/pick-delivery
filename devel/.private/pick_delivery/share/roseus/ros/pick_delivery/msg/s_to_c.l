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
  :slots (_sender _receiver _msgs _msgr ))

(defmethod pick_delivery::s_to_c
  (:init
   (&key
    ((:sender __sender) "")
    ((:receiver __receiver) "")
    ((:msgs __msgs) "")
    ((:msgr __msgr) "")
    )
   (send-super :init)
   (setq _sender (string __sender))
   (setq _receiver (string __receiver))
   (setq _msgs (string __msgs))
   (setq _msgr (string __msgr))
   self)
  (:sender
   (&optional __sender)
   (if __sender (setq _sender __sender)) _sender)
  (:receiver
   (&optional __receiver)
   (if __receiver (setq _receiver __receiver)) _receiver)
  (:msgs
   (&optional __msgs)
   (if __msgs (setq _msgs __msgs)) _msgs)
  (:msgr
   (&optional __msgr)
   (if __msgr (setq _msgr __msgr)) _msgr)
  (:serialization-length
   ()
   (+
    ;; string _sender
    4 (length _sender)
    ;; string _receiver
    4 (length _receiver)
    ;; string _msgs
    4 (length _msgs)
    ;; string _msgr
    4 (length _msgr)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sender
       (write-long (length _sender) s) (princ _sender s)
     ;; string _receiver
       (write-long (length _receiver) s) (princ _receiver s)
     ;; string _msgs
       (write-long (length _msgs) s) (princ _msgs s)
     ;; string _msgr
       (write-long (length _msgr) s) (princ _msgr s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sender
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sender (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _receiver
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _receiver (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _msgs
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgs (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _msgr
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgr (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get pick_delivery::s_to_c :md5sum-) "8e7cff9e499fc0facdc642b5e46e6fa7")
(setf (get pick_delivery::s_to_c :datatype-) "pick_delivery/s_to_c")
(setf (get pick_delivery::s_to_c :definition-)
      "string sender
string receiver
string msgs
string msgr
")



(provide :pick_delivery/s_to_c "8e7cff9e499fc0facdc642b5e46e6fa7")


