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
  :slots (_msgs ))

(defmethod pick_delivery::s_to_c
  (:init
   (&key
    ((:msgs __msgs) "")
    )
   (send-super :init)
   (setq _msgs (string __msgs))
   self)
  (:msgs
   (&optional __msgs)
   (if __msgs (setq _msgs __msgs)) _msgs)
  (:serialization-length
   ()
   (+
    ;; string _msgs
    4 (length _msgs)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msgs
       (write-long (length _msgs) s) (princ _msgs s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msgs
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgs (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get pick_delivery::s_to_c :md5sum-) "1d8e418f1fcd36e8930c91006766237d")
(setf (get pick_delivery::s_to_c :datatype-) "pick_delivery/s_to_c")
(setf (get pick_delivery::s_to_c :definition-)
      "string msgs
")



(provide :pick_delivery/s_to_c "1d8e418f1fcd36e8930c91006766237d")


