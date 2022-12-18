

extension MinToHours on int {
  double get minToHours {
    var hour = this ~/ 60;
    var min = (this % 60);
    var result = hour + (min / 100);
    return result.toDouble();
  }
}

extension MinToHoursString on int {
  String get minToHoursString {
    if(this==null)
      return "00:00";
    final int hour = this ~/ 60;
    final int minutes = this % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }
}

extension SecToMinString on int {
  String get secToMinString {
    final int min = this ~/ 60;
    final int sec = this % 60;
    return '${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}';
  }
}
extension SecToHrMinString on int {
  String get secToHrMinString {
    final int hour = this ~/ 3600;
    final int min = (this % 3600)~/60;
    return '${hour.toString().padLeft(2, "0")}:${min.toString().padLeft(2, "0")}';
  }
}

extension MinToHumanReadableTime on int {
  String get minToHumanReadableTime {
    final int hour = this ~/ 60;
    final int min = (this % 60);
    return '$hour ساعت و $min دقیقه';
    return '${ '$hour ساعت'}و${'$min دقیقه'}';
  }
}