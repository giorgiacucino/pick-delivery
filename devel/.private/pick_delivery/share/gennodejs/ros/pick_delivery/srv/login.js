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

class loginRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.aula = null;
      this.type_service = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('aula')) {
        this.aula = initObj.aula
      }
      else {
        this.aula = '';
      }
      if (initObj.hasOwnProperty('type_service')) {
        this.type_service = initObj.type_service
      }
      else {
        this.type_service = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type loginRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [aula]
    bufferOffset = _serializer.string(obj.aula, buffer, bufferOffset);
    // Serialize message field [type_service]
    bufferOffset = _serializer.int64(obj.type_service, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type loginRequest
    let len;
    let data = new loginRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [aula]
    data.aula = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type_service]
    data.type_service = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    length += object.aula.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_delivery/loginRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '471c4d869261b4a263a94ce694fdb96d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    string aula
    int64 type_service
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new loginRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.aula !== undefined) {
      resolved.aula = msg.aula;
    }
    else {
      resolved.aula = ''
    }

    if (msg.type_service !== undefined) {
      resolved.type_service = msg.type_service;
    }
    else {
      resolved.type_service = 0
    }

    return resolved;
    }
};

class loginResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.serv_resp = null;
    }
    else {
      if (initObj.hasOwnProperty('serv_resp')) {
        this.serv_resp = initObj.serv_resp
      }
      else {
        this.serv_resp = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type loginResponse
    // Serialize message field [serv_resp]
    bufferOffset = _serializer.string(obj.serv_resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type loginResponse
    let len;
    let data = new loginResponse(null);
    // Deserialize message field [serv_resp]
    data.serv_resp = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.serv_resp.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_delivery/loginResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '73a4fa3f623d7cbe9002ff135c328557';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string serv_resp
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new loginResponse(null);
    if (msg.serv_resp !== undefined) {
      resolved.serv_resp = msg.serv_resp;
    }
    else {
      resolved.serv_resp = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: loginRequest,
  Response: loginResponse,
  md5sum() { return 'f832b245f80447f012d2bc11a8aa30b1'; },
  datatype() { return 'pick_delivery/login'; }
};
