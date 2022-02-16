; Auto-generated. Do not edit!


(cl:in-package pick_delivery-msg)


;//! \htmlinclude c_to_s.msg.html

(cl:defclass <c_to_s> (roslisp-msg-protocol:ros-message)
  ((sender
    :reader sender
    :initarg :sender
    :type cl:string
    :initform "")
   (receiver
    :reader receiver
    :initarg :receiver
    :type cl:string
    :initform "")
   (auladest
    :reader auladest
    :initarg :auladest
    :type cl:string
    :initform ""))
)

(cl:defclass c_to_s (<c_to_s>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <c_to_s>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'c_to_s)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-msg:<c_to_s> is deprecated: use pick_delivery-msg:c_to_s instead.")))

(cl:ensure-generic-function 'sender-val :lambda-list '(m))
(cl:defmethod sender-val ((m <c_to_s>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:sender-val is deprecated.  Use pick_delivery-msg:sender instead.")
  (sender m))

(cl:ensure-generic-function 'receiver-val :lambda-list '(m))
(cl:defmethod receiver-val ((m <c_to_s>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:receiver-val is deprecated.  Use pick_delivery-msg:receiver instead.")
  (receiver m))

(cl:ensure-generic-function 'auladest-val :lambda-list '(m))
(cl:defmethod auladest-val ((m <c_to_s>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:auladest-val is deprecated.  Use pick_delivery-msg:auladest instead.")
  (auladest m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <c_to_s>) ostream)
  "Serializes a message object of type '<c_to_s>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sender))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sender))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'receiver))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'receiver))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'auladest))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'auladest))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <c_to_s>) istream)
  "Deserializes a message object of type '<c_to_s>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sender) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sender) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'receiver) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'receiver) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'auladest) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'auladest) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "1edfb1960ffea85e363609983abdaaf3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'c_to_s)))
  "Returns md5sum for a message object of type 'c_to_s"
  "1edfb1960ffea85e363609983abdaaf3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<c_to_s>)))
  "Returns full string definition for message of type '<c_to_s>"
  (cl:format cl:nil "string sender~%string receiver~%string auladest~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'c_to_s)))
  "Returns full string definition for message of type 'c_to_s"
  (cl:format cl:nil "string sender~%string receiver~%string auladest~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <c_to_s>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sender))
     4 (cl:length (cl:slot-value msg 'receiver))
     4 (cl:length (cl:slot-value msg 'auladest))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <c_to_s>))
  "Converts a ROS message object to a list"
  (cl:list 'c_to_s
    (cl:cons ':sender (sender msg))
    (cl:cons ':receiver (receiver msg))
    (cl:cons ':auladest (auladest msg))
))
