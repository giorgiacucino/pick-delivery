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

class invioRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sender = null;
      this.aula = null;
      this.receiver = null;
    }
    else {
      if (initObj.hasOwnProperty('sender')) {
        this.sender = initObj.sender
      }
      else {
        this.sender = '';
      }
      if (initObj.hasOwnProperty('aula')) {
        this.aula = initObj.aula
      }
      else {
        this.aula = '';
      }
      if (initObj.hasOwnProperty('receiver')) {
        this.receiver = initObj.receiver
      }
      else {
        this.receiver = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type invioRequest
    // Serialize message field [sender]
    bufferOffset = _serializer.string(obj.sender, buffer, bufferOffset);
    // Serialize message field [aula]
    bufferOffset = _serializer.string(obj.aula, buffer, bufferOffset);
    // Serialize message field [receiver]
    bufferOffset = _serializer.string(obj.receiver, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type invioRequest
    let len;
    let data = new invioRequest(null);
    // Deserialize message field [sender]
    data.sender = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [aula]
    data.aula = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [receiver]
    data.receiver = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.sender.length;
    length += object.aula.length;
    length += object.receiver.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_delivery/invioRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95c1779d8c2cf33dfbc1dc143b15edc7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sender
    string aula
    string receiver
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new invioRequest(null);
    if (msg.sender !== undefined) {
      resolved.sender = msg.sender;
    }
    else {
      resolved.sender = ''
    }

    if (msg.aula !== undefined) {
      resolved.aula = msg.aula;
    }
    else {
      resolved.aula = ''
    }

    if (msg.receiver !== undefined) {
      resolved.receiver = msg.receiver;
    }
    else {
      resolved.receiver = ''
    }

    return resolved;
    }
};

class invioResponse {
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
        this.serv_resp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type invioResponse
    // Serialize message field [serv_resp]
    bufferOffset = _serializer.int64(obj.serv_resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type invioResponse
    let len;
    let data = new invioResponse(null);
    // Deserialize message field [serv_resp]
    data.serv_resp = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_delivery/invioResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7e72a2e640338b0dea77e035e6c49733';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 serv_resp
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new invioResponse(null);
    if (msg.serv_resp !== undefined) {
      resolved.serv_resp = msg.serv_resp;
    }
    else {
      resolved.serv_resp = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: invioRequest,
  Response: invioResponse,
  md5sum() { return '71b5c4d20a9c9adce22eff539e04418e'; },
  datatype() { return 'pick_delivery/invio'; }
};
