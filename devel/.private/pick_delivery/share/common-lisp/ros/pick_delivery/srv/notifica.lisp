; Auto-generated. Do not edit!


(cl:in-package pick_delivery-srv)


;//! \htmlinclude notifica-request.msg.html

(cl:defclass <notifica-request> (roslisp-msg-protocol:ros-message)
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
    :initform ""))
)

(cl:defclass notifica-request (<notifica-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <notifica-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'notifica-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-srv:<notifica-request> is deprecated: use pick_delivery-srv:notifica-request instead.")))

(cl:ensure-generic-function 'user-val :lambda-list '(m))
(cl:defmethod user-val ((m <notifica-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:user-val is deprecated.  Use pick_delivery-srv:user instead.")
  (user m))

(cl:ensure-generic-function 'auladest-val :lambda-list '(m))
(cl:defmethod auladest-val ((m <notifica-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:auladest-val is deprecated.  Use pick_delivery-srv:auladest instead.")
  (auladest m))

(cl:ensure-generic-function 'msg-val :lambda-list '(m))
(cl:defmethod msg-val ((m <notifica-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:msg-val is deprecated.  Use pick_delivery-srv:msg instead.")
  (msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <notifica-request>) ostream)
  "Serializes a message object of type '<notifica-request>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <notifica-request>) istream)
  "Deserializes a message object of type '<notifica-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<notifica-request>)))
  "Returns string type for a service object of type '<notifica-request>"
  "pick_delivery/notificaRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'notifica-request)))
  "Returns string type for a service object of type 'notifica-request"
  "pick_delivery/notificaRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<notifica-request>)))
  "Returns md5sum for a message object of type '<notifica-request>"
  "b3820e35b2fce1d8d4821fc34321f691")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'notifica-request)))
  "Returns md5sum for a message object of type 'notifica-request"
  "b3820e35b2fce1d8d4821fc34321f691")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<notifica-request>)))
  "Returns full string definition for message of type '<notifica-request>"
  (cl:format cl:nil "string user~%string auladest~%string msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'notifica-request)))
  "Returns full string definition for message of type 'notifica-request"
  (cl:format cl:nil "string user~%string auladest~%string msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <notifica-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'user))
     4 (cl:length (cl:slot-value msg 'auladest))
     4 (cl:length (cl:slot-value msg 'msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <notifica-request>))
  "Converts a ROS message object to a list"
  (cl:list 'notifica-request
    (cl:cons ':user (user msg))
    (cl:cons ':auladest (auladest msg))
    (cl:cons ':msg (msg msg))
))
;//! \htmlinclude notifica-response.msg.html

(cl:defclass <notifica-response> (roslisp-msg-protocol:ros-message)
  ((picked
    :reader picked
    :initarg :picked
    :type cl:integer
    :initform 0))
)

(cl:defclass notifica-response (<notifica-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <notifica-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'notifica-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-srv:<notifica-response> is deprecated: use pick_delivery-srv:notifica-response instead.")))

(cl:ensure-generic-function 'picked-val :lambda-list '(m))
(cl:defmethod picked-val ((m <notifica-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:picked-val is deprecated.  Use pick_delivery-srv:picked instead.")
  (picked m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <notifica-response>) ostream)
  "Serializes a message object of type '<notifica-response>"
  (cl:let* ((signed (cl:slot-value msg 'picked)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <notifica-response>) istream)
  "Deserializes a message object of type '<notifica-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'picked) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<notifica-response>)))
  "Returns string type for a service object of type '<notifica-response>"
  "pick_delivery/notificaResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'notifica-response)))
  "Returns string type for a service object of type 'notifica-response"
  "pick_delivery/notificaResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<notifica-response>)))
  "Returns md5sum for a message object of type '<notifica-response>"
  "b3820e35b2fce1d8d4821fc34321f691")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'notifica-response)))
  "Returns md5sum for a message object of type 'notifica-response"
  "b3820e35b2fce1d8d4821fc34321f691")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<notifica-response>)))
  "Returns full string definition for message of type '<notifica-response>"
  (cl:format cl:nil "int64 picked~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'notifica-response)))
  "Returns full string definition for message of type 'notifica-response"
  (cl:format cl:nil "int64 picked~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <notifica-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <notifica-response>))
  "Converts a ROS message object to a list"
  (cl:list 'notifica-response
    (cl:cons ':picked (picked msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'notifica)))
  'notifica-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'notifica)))
  'notifica-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'notifica)))
  "Returns string type for a service object of type '<notifica>"
  "pick_delivery/notifica")