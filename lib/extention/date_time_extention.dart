
import 'package:intl/intl.dart';

extension YearAndMonthFormat on DateTime{
  String get yearAndMonthFormat {
    return DateFormat('MMMM yyyy').format(this);
  }

}
extension YearFormat on DateTime{
  String get yearFormat {
    return DateFormat('yyyy').format(this);
  }
}
extension MonthFormat on DateTime{
  String get monthFormat {
    return DateFormat('MMMM').format(this);
  }
}

extension DayFormat on DateTime{
  String get dayFormat {
    return DateFormat('dd').format(this);
  }
}

extension FirstDayFormat on DateTime{
  String get firstDayFormat {
    return DateFormat('MMM dd').format(this);
  }
}

extension FullDayFormat on DateTime{
  String get fullDayFormat {
    return DateFormat('EEE MMM dd, yyyy').format(this);
  }
}

extension DayFormat1 on DateTime{
  String get apiDayFormat1 {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

extension TimeFormat on DateTime{
  String get timeFormat {
    return DateFormat('H:m:s').format(this);
  }
}

extension TimeFormat1 on DateTime{
  String get timeFormat1 {
    return DateFormat('HH:mm').format(this);
  }
}

extension DateAndTimeFormat on DateTime{
  String get dateAndTimeFormat {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(this);
  }
}

extension TimeAndDateFormat on DateTime{
  String get timeAndDateFormat {
    return DateFormat('hh:mm a  d MMM yyyy').format(this);
  }
}

extension  FullDateAndTimeFormat on DateTime{
  String get fullDateAndTimeFormat  {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(this);
  }
}

extension  WeekDayFormat on DateTime{
  String get weekDayFormat  {
    return DateFormat('EEEE').format(this);
  }
}

extension  DayAndMonthFormat on DateTime{
  String get dayAndMonthFormat  {
    return DateFormat('dd-MM').format(this);
  }
}
extension  DayAndMonthFormat1 on DateTime{
  String get dayAndMonthFormat1  {
    return DateFormat('dd MM').format(this);
  }
}

extension AmAndPMTime on DateTime{
  String get amAndPMTime  {
    return DateFormat('hh:mm/a').format(this);
  }
}