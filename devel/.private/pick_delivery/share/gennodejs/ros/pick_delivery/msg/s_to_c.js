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
      this.msgs = null;
    }
    else {
      if (initObj.hasOwnProperty('msgs')) {
        this.msgs = initObj.msgs
      }
      else {
        this.msgs = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type s_to_c
    // Serialize message field [msgs]
    bufferOffset = _serializer.string(obj.msgs, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type s_to_c
    let len;
    let data = new s_to_c(null);
    // Deserialize message field [msgs]
    data.msgs = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.msgs.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pick_delivery/s_to_c';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1d8e418f1fcd36e8930c91006766237d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msgs
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new s_to_c(null);
    if (msg.msgs !== undefined) {
      resolved.msgs = msg.msgs;
    }
    else {
      resolved.msgs = ''
    }

    return resolved;
    }
};

module.exports = s_to_c;
