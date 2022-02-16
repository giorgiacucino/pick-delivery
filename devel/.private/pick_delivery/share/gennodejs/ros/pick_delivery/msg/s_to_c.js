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
      this.sender = null;
      this.receiver = null;
      this.msgs = null;
      this.msgr = null;
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
      if (initObj.hasOwnProperty('msgs')) {
        this.msgs = initObj.msgs
      }
      else {
        this.msgs = '';
      }
      if (initObj.hasOwnProperty('msgr')) {
        this.msgr = initObj.msgr
      }
      else {
        this.msgr = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type s_to_c
    // Serialize message field [sender]
    bufferOffset = _serializer.string(obj.sender, buffer, bufferOffset);
    // Serialize message field [receiver]
    bufferOffset = _serializer.string(obj.receiver, buffer, bufferOffset);
    // Serialize message field [msgs]
    bufferOffset = _serializer.string(obj.msgs, buffer, bufferOffset);
    // Serialize message field [msgr]
    bufferOffset = _serializer.string(obj.msgr, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type s_to_c
    let len;
    let data = new s_to_c(null);
    // Deserialize message field [sender]
    data.sender = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [receiver]
    data.receiver = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [msgs]
    data.msgs = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [msgr]
    data.msgr = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.sender.length;
    length += object.receiver.length;
    length += object.msgs.length;
    length += object.msgr.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pick_delivery/s_to_c';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e7cff9e499fc0facdc642b5e46e6fa7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sender
    string receiver
    string msgs
    string msgr
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new s_to_c(null);
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

    if (msg.msgs !== undefined) {
      resolved.msgs = msg.msgs;
    }
    else {
      resolved.msgs = ''
    }

    if (msg.msgr !== undefined) {
      resolved.msgr = msg.msgr;
    }
    else {
      resolved.msgr = ''
    }

    return resolved;
    }
};

module.exports = s_to_c;
