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

class s_to_c {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user = null;
      this.auladest = null;
      this.msg = null;
      this.pd = null;
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
      if (initObj.hasOwnProperty('pd')) {
        this.pd = initObj.pd
      }
      else {
        this.pd = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type s_to_c
    // Serialize message field [user]
    bufferOffset = _serializer.string(obj.user, buffer, bufferOffset);
    // Serialize message field [auladest]
    bufferOffset = _serializer.string(obj.auladest, buffer, bufferOffset);
    // Serialize message field [msg]
    bufferOffset = _serializer.string(obj.msg, buffer, bufferOffset);
    // Serialize message field [pd]
    bufferOffset = _serializer.int64(obj.pd, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type s_to_c
    let len;
    let data = new s_to_c(null);
    // Deserialize message field [user]
    data.user = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [auladest]
    data.auladest = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [msg]
    data.msg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pd]
    data.pd = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.user.length;
    length += object.auladest.length;
    length += object.msg.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pick_delivery/s_to_c';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4026358b2d8ac7d89ae115170c802353';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string user
    string auladest
    string msg
    int64 pd
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new s_to_c(null);
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

    if (msg.pd !== undefined) {
      resolved.pd = msg.pd;
    }
    else {
      resolved.pd = 0
    }

    return resolved;
    }
};

module.exports = s_to_c;
