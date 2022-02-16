; Auto-generated. Do not edit!


(cl:in-package pick_delivery-msg)


;//! \htmlinclude s_to_c.msg.html

(cl:defclass <s_to_c> (roslisp-msg-protocol:ros-message)
  ((msgs
    :reader msgs
    :initarg :msgs
    :type cl:string
    :initform ""))
)

(cl:defclass s_to_c (<s_to_c>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <s_to_c>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 's_to_c)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-msg:<s_to_c> is deprecated: use pick_delivery-msg:s_to_c instead.")))

(cl:ensure-generic-function 'msgs-val :lambda-list '(m))
(cl:defmethod msgs-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:msgs-val is deprecated.  Use pick_delivery-msg:msgs instead.")
  (msgs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <s_to_c>) ostream)
  "Serializes a message object of type '<s_to_c>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <s_to_c>) istream)
  "Deserializes a message object of type '<s_to_c>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgs) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgs) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<s_to_c>)))
  "Returns string type for a message object of type '<s_to_c>"
  "pick_delivery/s_to_c")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 's_to_c)))
  "Returns string type for a message object of type 's_to_c"
  "pick_delivery/s_to_c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<s_to_c>)))
  "Returns md5sum for a message object of type '<s_to_c>"
  "1d8e418f1fcd36e8930c91006766237d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 's_to_c)))
  "Returns md5sum for a message object of type 's_to_c"
  "1d8e418f1fcd36e8930c91006766237d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<s_to_c>)))
  "Returns full string definition for message of type '<s_to_c>"
  (cl:format cl:nil "string msgs~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 's_to_c)))
  "Returns full string definition for message of type 's_to_c"
  (cl:format cl:nil "string msgs~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <s_to_c>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgs))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <s_to_c>))
  "Converts a ROS message object to a list"
  (cl:list 's_to_c
    (cl:cons ':msgs (msgs msg))
))
