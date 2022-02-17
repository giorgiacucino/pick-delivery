// Auto-generated. Do not edit!

// (in-package pick_delivery.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class notificaRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user = null;
      this.auladest = null;
      this.msg = null;
    }
    else {
      if (initObj.hasOwnProperty('user')) {
        this.user = initObj.user
      }
      else {
        this.user = '';
      }
      if (initObj.hasOwnProperty('auladest')) {
        this.auladest = initObj.auladest
      }
      else {
        this.auladest = '';
      }
      if (initObj.hasOwnProperty('msg')) {
        this.msg = initObj.msg
      }
      else {
        this.msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type notificaRequest
    // Serialize message field [user]
    bufferOffset = _serializer.string(obj.user, buffer, bufferOffset);
    // Serialize message field [auladest]
    bufferOffset = _serializer.string(obj.auladest, buffer, bufferOffset);
    // Serialize message field [msg]
    bufferOffset = _serializer.string(obj.msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type notificaRequest
    let len;
    let data = new notificaRequest(null);
    // Deserialize message field [user]
    data.user = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [auladest]
    data.auladest = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [msg]
    data.msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.user.length;
    length += object.auladest.length;
    length += object.msg.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_delivery/notificaRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '40c9053b48755e02cc19c6f52dd2cd70';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string user
    string auladest
    string msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new notificaRequest(null);
    if (msg.user !== undefined) {
      resolved.user = msg.user;
    }
    else {
      resolved.user = ''
    }

    if (msg.auladest !== undefined) {
      resolved.auladest = msg.auladest;
    }
    else {
      resolved.auladest = ''
    }

    if (msg.msg !== undefined) {
      resolved.msg = msg.msg;
    }
    else {
      resolved.msg = ''
    }

    return resolved;
    }
};

class notificaResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.picked = null;
    }
    else {
      if (initObj.hasOwnProperty('picked')) {
        this.picked = initObj.picked
      }
      else {
        this.picked = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type notificaResponse
    // Serialize message field [picked]
    bufferOffset = _serializer.int64(obj.picked, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type notificaResponse
    let len;
    let data = new notificaResponse(null);
    // Deserialize message field [picked]
    data.picked = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_delivery/notificaResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '60195036f73783f31463727fb92dff5d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 picked
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new notificaResponse(null);
    if (msg.picked !== undefined) {
      resolved.picked = msg.picked;
    }
    else {
      resolved.picked = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: notificaRequest,
  Response: notificaResponse,
  md5sum() { return 'b3820e35b2fce1d8d4821fc34321f691'; },
  datatype() { return 'pick_delivery/notifica'; }
};
