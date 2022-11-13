import 'package:intl/intl.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

extension ParseDate on String {
  DateTime get parseToDate {
    DateTime date = DateTime.now();
    date = DateTime.tryParse(this)!;
    return date;

    // moneyFormatter = 'RM${this}'
  }
}

// extension ParseShamsiToDateTime on String {
//   String get shamsiToDateTime {
//     if (this == null) return '';
//     debugPrint("DATE AND TIME " + PersianDateTime(jalaaliDateTime: this).datetime.toIso8601String());
//     return PersianDateTime(jalaaliDateTime: this).datetime.toIso8601String();
//
//     // moneyFormatter = 'RM${this}'
//   }
// }

extension ParseDateTimeToShamsiDate on String {
  String get dateTimeToShamsiDate {
    if (this == null) return '';
    return DateTime.tryParse(this)!.toPersianDate(twoDigits: false);
    // moneyFormatter = 'RM${this}'
  }
}

extension ParseDateTimeToTime on String {
  String get dateTimeToTime {
    if (this == null) return '';
    return DateFormat.Hm().format(DateTime.tryParse(this)!);
    // moneyFormatter = 'RM${this}'
  }
}

extension ParseDateTimeToShamsiDateAndTime on String {
  String get dateTimeToShamsiDateAndTime {
    if (this == null) return '';
    return DateTime.tryParse(this)!.toPersianDate(twoDigits: true);

    // moneyFormatter = 'RM${this}'
  }
}

extension ParseDateTimeToHumanReadable on String {
  String get parseDateTimeToHumanReadable {
    if (this == null) return '';
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var date = DateTime.parse(this);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' روز پیش';
      } else {
        time = diff.inDays.toString() + ' روز پیش';
      }
    } else {
      if (diff.inDays <= 7) {
        time = (diff.inDays / 7).floor().toString() + ' هفته پیش';
      } else if (diff.inDays > 7 && diff.inDays <= 365) {
        time = (diff.inDays / 30).floor().toString() + ' ماه پیش';
      } else if (diff.inDays > 365) {
        time = (diff.inDays / 365).floor().toString() + ' سال پیش';
      }
    }

    return time.replaceAll('AM', 'صبح').replaceAll('PM', 'بعد از ظهر');
  }
}

extension FileName on String {
  String get fileName {
    if (this == null) return '';
    return (split('/').last).length <= 18 ? split('/').last : split('/').last.substring(0, 18);
  }
}

extension ParseDoubleToString on String {
  double get toDouble {
    if (this == null) return 0.0;
    return double.tryParse(this)!;
  }
}

extension TempToIndex on String {
  String get parseTempToIndex {
    switch (this) {
      case "16":
        return "B";

      case "17":
        return "C";

      case "18":
        return "D";

      case "19":
        return "E";

      case "20":
        return "F";
      case "21":
        return "G";

      case "22":
        return "H";

      case "23":
        return "I";

      case "24":
        return "J";

      case "1":
        return "A";

      case "2":
        return "B";

      case "3":
        return "C";

      case "4":
        return "D";

      case "5":
        return "E";

      case "6":
        return "F";

      case "7":
        return "G";
    }
    return 'null';
  }

  String parseIndexToTemp({bool? isRef}) {
    switch (this) {
      case "A":
        return '1';
      case "B":
        return isRef! ? '2' : '16';

      case "C":
        return isRef! ? '3' : '17';

      case "D":
        return isRef! ? '4' : '18';
      case "E":
        return isRef! ? '5' : '19';
      case "F":
        return isRef! ? '6' : '20';
      case "G":
        return isRef! ? '7' : '21';
      case "H":
        return '22';
      case "I":
        return '23';
      case "J":
        return '24';
      default:
        return isRef! ? '0' : '15';

    }
  }
}

extension ParseRefModeToBool on String {
  bool get parseRefModeToBool {
    switch (this) {
      case "Y":
        return true;
      case "N":
        return false;
    }
    return false;
  }
}

extension ParseBoolToRefMode on bool {
  String get parseBoolToRefMode {
    switch (this) {
      case true:
        return 'Y';
      case false:
        return 'N';
    }
    return 'X';
  }
}

extension MinToHour on String {
  String get minToHour {
    if (isEmpty) {
      return "00:00";
    }
    var min = int.tryParse(this);
    final int hour = min! ~/ 60;
    final int minutes = min % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }
}

// extension HttpMethodToString on String {
//   RequestMethod get httpMethodToString {
//     RequestMethod result = RequestMethod.GET;
//     var method = this.toUpperCase();
//     switch (method) {
//       case 'GET':
//         result = RequestMethod.GET;
//         break;
//       case 'POST':
//         result = RequestMethod.POST;
//
//         break;
//       case 'PUT':
//         result = RequestMethod.PUT;
//
//         break;
//       case 'DELETE':
//         result = RequestMethod.DELETE;
//
//         break;
//     }
//     return result;
//   }
// }

extension ParseTempDToString on int {
  String get parseTempDToString {
    switch (this) {
      case 15:
        return 'Cold';
      case 30:
        return '30 °C';
      case 40:
        return '40 °C';
      case 60:
        return '60 °C';
      case 95:
        return '95 °C';
      default:
        return '';
    }
  }
}

extension FormatTemp on String {
  String get formatTemp {
    if (this.isEmpty) {
      return '0 °c';
    }
    return this + ' °c';
  }
}

extension FormatTempFrezz on String {
  String get formatTempFrezz {
    if (this.isEmpty) {
      return '0 °c';
    }
    return '-'+ this + ' °c';
  }
}

// extension FormatOption on String {
//   String? get formatOption {
//     var typed = globalSetting!.homeDevice!.typed;
//     var split = this.split('');
//     var concatList = <String>[];
//     for (var element in split) {
//       switch (element) {
//         case 'A':
//           concatList.add('Pre wash');
//           break;
//         case 'B':
//           concatList.add(typed == WM71 ? 'Magic flow' : 'Islamic rinse');
//           break;
//         case 'C':
//           concatList.add('Easy iron');
//           break;
//         case 'D':
//           concatList.add('Jet wash');
//           break;
//
//       }
//     }
//     return concatList.join(',');
//   }
// }

extension FormatStep on String {
  String? get formatStep {

      switch (this) {
        case '80':
          return 'Pre wash';
        case '87':
          return 'Main wash';
        case '82':
          return 'Rinse';
        case '83':
          return 'Spin';
      }
    }

}


