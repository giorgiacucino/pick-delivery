// Auto-generated. Do not edit!

// (in-package pick_delivery.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class c_to_s {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sender = null;
      this.receiver = null;
      this.auladest = null;
    }
    else {
      if (initObj.hasOwnProperty('sender')) {
        this.sender = initObj.sender
      }
      else {
        this.sender = '';
      }
      if (initObj.hasOwnProperty('receiver')) {
        this.receiver = initObj.receiver
      }
      else {
        this.receiver = '';
      }
      if (initObj.hasOwnProperty('auladest')) {
        this.auladest = initObj.auladest
      }
      else {
        this.auladest = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type c_to_s
    // Serialize message field [sender]
    bufferOffset = _serializer.string(obj.sender, buffer, bufferOffset);
    // Serialize message field [receiver]
    bufferOffset = _serializer.string(obj.receiver, buffer, bufferOffset);
    // Serialize message field [auladest]
    bufferOffset = _serializer.string(obj.auladest, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type c_to_s
    let len;
    let data = new c_to_s(null);
    // Deserialize message field [sender]
    data.sender = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [receiver]
    data.receiver = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [auladest]
    data.auladest = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.sender.length;
    length += object.receiver.length;
    length += object.auladest.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pick_delivery/c_to_s';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1edfb1960ffea85e363609983abdaaf3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sender
    string receiver
    string auladest
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new c_to_s(null);
    if (msg.sender !== undefined) {
      resolved.sender = msg.sender;
    }
    else {
      resolved.sender = ''
    }

    if (msg.receiver !== undefined) {
      resolved.receiver = msg.receiver;
    }
    else {
      resolved.receiver = ''
    }

    if (msg.auladest !== undefined) {
      resolved.auladest = msg.auladest;
    }
    else {
      resolved.auladest = ''
    }

    return resolved;
    }
};

module.exports = c_to_s;
