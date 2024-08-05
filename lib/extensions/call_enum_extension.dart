extension CallEnumExtension on CallEnum {
  static CallEnum fromString(String status) {
    switch (status.toLowerCase()) {
      case 'missedcall':
        return CallEnum.missedCall;
      case 'incomingcall':
        return CallEnum.incomingCall;
      case 'outgoingcall':
        return CallEnum.outgoingCall;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }

  String toShortString() {
    return toString().split('.').last;
  }
}

enum CallEnum {
  missedCall,
  incomingCall,
  outgoingCall,
}
