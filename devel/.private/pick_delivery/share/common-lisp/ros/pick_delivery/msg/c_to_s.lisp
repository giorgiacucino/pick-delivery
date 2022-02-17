; Auto-generated. Do not edit!


(cl:in-package pick_delivery-msg)


;//! \htmlinclude c_to_s.msg.html

(cl:defclass <c_to_s> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type cl:integer
    :initform 0))
)

(cl:defclass c_to_s (<c_to_s>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <c_to_s>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'c_to_s)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-msg:<c_to_s> is deprecated: use pick_delivery-msg:c_to_s instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <c_to_s>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:resp-val is deprecated.  Use pick_delivery-msg:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <c_to_s>) ostream)
  "Serializes a message object of type '<c_to_s>"
  (cl:let* ((signed (cl:slot-value msg 'resp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <c_to_s>) istream)
  "Deserializes a message object of type '<c_to_s>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'resp) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<c_to_s>)))
  "Returns string type for a message object of type '<c_to_s>"
  "pick_delivery/c_to_s")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'c_to_s)))
  "Returns string type for a message object of type 'c_to_s"
  "pick_delivery/c_to_s")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<c_to_s>)))
  "Returns md5sum for a message object of type '<c_to_s>"
  "15982c3a12e735514ac7ff5c21fc3ece")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'c_to_s)))
  "Returns md5sum for a message object of type 'c_to_s"
  "15982c3a12e735514ac7ff5c21fc3ece")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<c_to_s>)))
  "Returns full string definition for message of type '<c_to_s>"
  (cl:format cl:nil "int64 resp~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'c_to_s)))
  "Returns full string definition for message of type 'c_to_s"
  (cl:format cl:nil "int64 resp~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <c_to_s>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <c_to_s>))
  "Converts a ROS message object to a list"
  (cl:list 'c_to_s
    (cl:cons ':resp (resp msg))
))
