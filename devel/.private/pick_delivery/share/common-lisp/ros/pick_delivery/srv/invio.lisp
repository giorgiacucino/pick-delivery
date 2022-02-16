; Auto-generated. Do not edit!


(cl:in-package pick_delivery-srv)


;//! \htmlinclude invio-request.msg.html

(cl:defclass <invio-request> (roslisp-msg-protocol:ros-message)
  ((sender
    :reader sender
    :initarg :sender
    :type cl:string
    :initform "")
   (aula
    :reader aula
    :initarg :aula
    :type cl:string
    :initform "")
   (receiver
    :reader receiver
    :initarg :receiver
    :type cl:string
    :initform ""))
)

(cl:defclass invio-request (<invio-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <invio-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'invio-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-srv:<invio-request> is deprecated: use pick_delivery-srv:invio-request instead.")))

(cl:ensure-generic-function 'sender-val :lambda-list '(m))
(cl:defmethod sender-val ((m <invio-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:sender-val is deprecated.  Use pick_delivery-srv:sender instead.")
  (sender m))

(cl:ensure-generic-function 'aula-val :lambda-list '(m))
(cl:defmethod aula-val ((m <invio-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:aula-val is deprecated.  Use pick_delivery-srv:aula instead.")
  (aula m))

(cl:ensure-generic-function 'receiver-val :lambda-list '(m))
(cl:defmethod receiver-val ((m <invio-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:receiver-val is deprecated.  Use pick_delivery-srv:receiver instead.")
  (receiver m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <invio-request>) ostream)
  "Serializes a message object of type '<invio-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sender))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sender))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'aula))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'aula))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'receiver))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'receiver))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <invio-request>) istream)
  "Deserializes a message object of type '<invio-request>"
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
      (cl:setf (cl:slot-value msg 'aula) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'aula) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'receiver) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'receiver) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<invio-request>)))
  "Returns string type for a service object of type '<invio-request>"
  "pick_delivery/invioRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'invio-request)))
  "Returns string type for a service object of type 'invio-request"
  "pick_delivery/invioRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<invio-request>)))
  "Returns md5sum for a message object of type '<invio-request>"
  "71b5c4d20a9c9adce22eff539e04418e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'invio-request)))
  "Returns md5sum for a message object of type 'invio-request"
  "71b5c4d20a9c9adce22eff539e04418e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<invio-request>)))
  "Returns full string definition for message of type '<invio-request>"
  (cl:format cl:nil "string sender~%string aula~%string receiver~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'invio-request)))
  "Returns full string definition for message of type 'invio-request"
  (cl:format cl:nil "string sender~%string aula~%string receiver~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <invio-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sender))
     4 (cl:length (cl:slot-value msg 'aula))
     4 (cl:length (cl:slot-value msg 'receiver))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <invio-request>))
  "Converts a ROS message object to a list"
  (cl:list 'invio-request
    (cl:cons ':sender (sender msg))
    (cl:cons ':aula (aula msg))
    (cl:cons ':receiver (receiver msg))
))
;//! \htmlinclude invio-response.msg.html

(cl:defclass <invio-response> (roslisp-msg-protocol:ros-message)
  ((serv_resp
    :reader serv_resp
    :initarg :serv_resp
    :type cl:integer
    :initform 0))
)

(cl:defclass invio-response (<invio-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <invio-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'invio-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-srv:<invio-response> is deprecated: use pick_delivery-srv:invio-response instead.")))

(cl:ensure-generic-function 'serv_resp-val :lambda-list '(m))
(cl:defmethod serv_resp-val ((m <invio-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:serv_resp-val is deprecated.  Use pick_delivery-srv:serv_resp instead.")
  (serv_resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <invio-response>) ostream)
  "Serializes a message object of type '<invio-response>"
  (cl:let* ((signed (cl:slot-value msg 'serv_resp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <invio-response>) istream)
  "Deserializes a message object of type '<invio-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'serv_resp) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<invio-response>)))
  "Returns string type for a service object of type '<invio-response>"
  "pick_delivery/invioResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'invio-response)))
  "Returns string type for a service object of type 'invio-response"
  "pick_delivery/invioResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<invio-response>)))
  "Returns md5sum for a message object of type '<invio-response>"
  "71b5c4d20a9c9adce22eff539e04418e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'invio-response)))
  "Returns md5sum for a message object of type 'invio-response"
  "71b5c4d20a9c9adce22eff539e04418e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<invio-response>)))
  "Returns full string definition for message of type '<invio-response>"
  (cl:format cl:nil "int64 serv_resp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'invio-response)))
  "Returns full string definition for message of type 'invio-response"
  (cl:format cl:nil "int64 serv_resp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <invio-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <invio-response>))
  "Converts a ROS message object to a list"
  (cl:list 'invio-response
    (cl:cons ':serv_resp (serv_resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'invio)))
  'invio-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'invio)))
  'invio-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'invio)))
  "Returns string type for a service object of type '<invio>"
  "pick_delivery/invio")