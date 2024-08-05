extension ChatTimeExtension on DateTime {
  String toChatTime() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    String period = this.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
