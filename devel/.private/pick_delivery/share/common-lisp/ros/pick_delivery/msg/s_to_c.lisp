; Auto-generated. Do not edit!


(cl:in-package pick_delivery-msg)


;//! \htmlinclude s_to_c.msg.html

(cl:defclass <s_to_c> (roslisp-msg-protocol:ros-message)
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
    :initform "")
   (msgs
    :reader msgs
    :initarg :msgs
    :type cl:string
    :initform "")
   (msgr
    :reader msgr
    :initarg :msgr
    :type cl:string
    :initform ""))
)

(cl:defclass s_to_c (<s_to_c>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <s_to_c>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 's_to_c)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-msg:<s_to_c> is deprecated: use pick_delivery-msg:s_to_c instead.")))

(cl:ensure-generic-function 'sender-val :lambda-list '(m))
(cl:defmethod sender-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:sender-val is deprecated.  Use pick_delivery-msg:sender instead.")
  (sender m))

(cl:ensure-generic-function 'receiver-val :lambda-list '(m))
(cl:defmethod receiver-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:receiver-val is deprecated.  Use pick_delivery-msg:receiver instead.")
  (receiver m))

(cl:ensure-generic-function 'auladest-val :lambda-list '(m))
(cl:defmethod auladest-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:auladest-val is deprecated.  Use pick_delivery-msg:auladest instead.")
  (auladest m))

(cl:ensure-generic-function 'msgs-val :lambda-list '(m))
(cl:defmethod msgs-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:msgs-val is deprecated.  Use pick_delivery-msg:msgs instead.")
  (msgs m))

(cl:ensure-generic-function 'msgr-val :lambda-list '(m))
(cl:defmethod msgr-val ((m <s_to_c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-msg:msgr-val is deprecated.  Use pick_delivery-msg:msgr instead.")
  (msgr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <s_to_c>) ostream)
  "Serializes a message object of type '<s_to_c>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgs))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgr))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <s_to_c>) istream)
  "Deserializes a message object of type '<s_to_c>"
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgs) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgs) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgr) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgr) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "0b8b43e320b3eab867baa8730a8cbde6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 's_to_c)))
  "Returns md5sum for a message object of type 's_to_c"
  "0b8b43e320b3eab867baa8730a8cbde6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<s_to_c>)))
  "Returns full string definition for message of type '<s_to_c>"
  (cl:format cl:nil "string sender~%string receiver~%string auladest~%string msgs~%string msgr~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 's_to_c)))
  "Returns full string definition for message of type 's_to_c"
  (cl:format cl:nil "string sender~%string receiver~%string auladest~%string msgs~%string msgr~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <s_to_c>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sender))
     4 (cl:length (cl:slot-value msg 'receiver))
     4 (cl:length (cl:slot-value msg 'auladest))
     4 (cl:length (cl:slot-value msg 'msgs))
     4 (cl:length (cl:slot-value msg 'msgr))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <s_to_c>))
  "Converts a ROS message object to a list"
  (cl:list 's_to_c
    (cl:cons ':sender (sender msg))
    (cl:cons ':receiver (receiver msg))
    (cl:cons ':auladest (auladest msg))
    (cl:cons ':msgs (msgs msg))
    (cl:cons ':msgr (msgr msg))
))
