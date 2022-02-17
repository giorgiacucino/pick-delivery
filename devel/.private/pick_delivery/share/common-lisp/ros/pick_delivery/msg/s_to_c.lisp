; Auto-generated. Do not edit!


(cl:in-package pick_delivery-msg)


;//! \htmlinclude s_to_c.msg.html

(cl:defclass <s_to_c> (roslisp-msg-protocol:ros-message)
  ((user
    :reader user
    :initarg :user
    :type cl:string
    :initform "")
   (auladest
    :reader auladest
    :initarg :auladest
    :type cl:string
    :initform "")
   (msg
    :reader msg
    :initarg :msg
    :type cl:string
    :initform "")
   (pd
    :reader pd
    :initarg :pd
    :type cl:integer
    :initform 0))
)

(cl:defclass s_to_c (<s_to_c>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <s_to_c>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 's_to_c)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-msg:<s_to_c> is deprecated: use pick_delivery-msg:s_to_c instead.")))

(cl:ensure-generic-function 'user-val :lambda-list '(m))
(cl:defmethod user-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:user-val is deprecated.  Use pick_delivery-msg:user instead.")
  (user m))

(cl:ensure-generic-function 'auladest-val :lambda-list '(m))
(cl:defmethod auladest-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:auladest-val is deprecated.  Use pick_delivery-msg:auladest instead.")
  (auladest m))

(cl:ensure-generic-function 'msg-val :lambda-list '(m))
(cl:defmethod msg-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:msg-val is deprecated.  Use pick_delivery-msg:msg instead.")
  (msg m))

(cl:ensure-generic-function 'pd-val :lambda-list '(m))
(cl:defmethod pd-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:pd-val is deprecated.  Use pick_delivery-msg:pd instead.")
  (pd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <s_to_c>) ostream)
  "Serializes a message object of type '<s_to_c>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'user))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'user))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'auladest))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'auladest))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msg))
  (cl:let* ((signed (cl:slot-value msg 'pd)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <s_to_c>) istream)
  "Deserializes a message object of type '<s_to_c>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'user) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'user) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'auladest) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'auladest) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pd) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
  "4026358b2d8ac7d89ae115170c802353")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 's_to_c)))
  "Returns md5sum for a message object of type 's_to_c"
  "4026358b2d8ac7d89ae115170c802353")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<s_to_c>)))
  "Returns full string definition for message of type '<s_to_c>"
  (cl:format cl:nil "string user~%string auladest~%string msg~%int64 pd~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 's_to_c)))
  "Returns full string definition for message of type 's_to_c"
  (cl:format cl:nil "string user~%string auladest~%string msg~%int64 pd~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <s_to_c>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'user))
     4 (cl:length (cl:slot-value msg 'auladest))
     4 (cl:length (cl:slot-value msg 'msg))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <s_to_c>))
  "Converts a ROS message object to a list"
  (cl:list 's_to_c
    (cl:cons ':user (user msg))
    (cl:cons ':auladest (auladest msg))
    (cl:cons ':msg (msg msg))
    (cl:cons ':pd (pd msg))
))
