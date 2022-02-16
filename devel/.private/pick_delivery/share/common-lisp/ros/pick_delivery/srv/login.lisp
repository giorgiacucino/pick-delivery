; Auto-generated. Do not edit!


(cl:in-package pick_delivery-srv)


;//! \htmlinclude login-request.msg.html

(cl:defclass <login-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (aula
    :reader aula
    :initarg :aula
    :type cl:string
    :initform "")
   (type_service
    :reader type_service
    :initarg :type_service
    :type cl:integer
    :initform 0))
)

(cl:defclass login-request (<login-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <login-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'login-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-srv:<login-request> is deprecated: use pick_delivery-srv:login-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <login-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:name-val is deprecated.  Use pick_delivery-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'aula-val :lambda-list '(m))
(cl:defmethod aula-val ((m <login-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:aula-val is deprecated.  Use pick_delivery-srv:aula instead.")
  (aula m))

(cl:ensure-generic-function 'type_service-val :lambda-list '(m))
(cl:defmethod type_service-val ((m <login-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:type_service-val is deprecated.  Use pick_delivery-srv:type_service instead.")
  (type_service m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <login-request>) ostream)
  "Serializes a message object of type '<login-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'aula))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'aula))
  (cl:let* ((signed (cl:slot-value msg 'type_service)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <login-request>) istream)
  "Deserializes a message object of type '<login-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'aula) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'aula) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type_service) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<login-request>)))
  "Returns string type for a service object of type '<login-request>"
  "pick_delivery/loginRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'login-request)))
  "Returns string type for a service object of type 'login-request"
  "pick_delivery/loginRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<login-request>)))
  "Returns md5sum for a message object of type '<login-request>"
  "f832b245f80447f012d2bc11a8aa30b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'login-request)))
  "Returns md5sum for a message object of type 'login-request"
  "f832b245f80447f012d2bc11a8aa30b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<login-request>)))
  "Returns full string definition for message of type '<login-request>"
  (cl:format cl:nil "string name~%string aula~%int64 type_service~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'login-request)))
  "Returns full string definition for message of type 'login-request"
  (cl:format cl:nil "string name~%string aula~%int64 type_service~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <login-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'aula))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <login-request>))
  "Converts a ROS message object to a list"
  (cl:list 'login-request
    (cl:cons ':name (name msg))
    (cl:cons ':aula (aula msg))
    (cl:cons ':type_service (type_service msg))
))
;//! \htmlinclude login-response.msg.html

(cl:defclass <login-response> (roslisp-msg-protocol:ros-message)
  ((serv_resp
    :reader serv_resp
    :initarg :serv_resp
    :type cl:string
    :initform ""))
)

(cl:defclass login-response (<login-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <login-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'login-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_delivery-srv:<login-response> is deprecated: use pick_delivery-srv:login-response instead.")))

(cl:ensure-generic-function 'serv_resp-val :lambda-list '(m))
(cl:defmethod serv_resp-val ((m <login-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_delivery-srv:serv_resp-val is deprecated.  Use pick_delivery-srv:serv_resp instead.")
  (serv_resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <login-response>) ostream)
  "Serializes a message object of type '<login-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'serv_resp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'serv_resp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <login-response>) istream)
  "Deserializes a message object of type '<login-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'serv_resp) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'serv_resp) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<login-response>)))
  "Returns string type for a service object of type '<login-response>"
  "pick_delivery/loginResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'login-response)))
  "Returns string type for a service object of type 'login-response"
  "pick_delivery/loginResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<login-response>)))
  "Returns md5sum for a message object of type '<login-response>"
  "f832b245f80447f012d2bc11a8aa30b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'login-response)))
  "Returns md5sum for a message object of type 'login-response"
  "f832b245f80447f012d2bc11a8aa30b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<login-response>)))
  "Returns full string definition for message of type '<login-response>"
  (cl:format cl:nil "string serv_resp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'login-response)))
  "Returns full string definition for message of type 'login-response"
  (cl:format cl:nil "string serv_resp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <login-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'serv_resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <login-response>))
  "Converts a ROS message object to a list"
  (cl:list 'login-response
    (cl:cons ':serv_resp (serv_resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'login)))
  'login-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'login)))
  'login-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'login)))
  "Returns string type for a service object of type '<login>"
  "pick_delivery/login")