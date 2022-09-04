import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';



extension MoneyExtention1 on num{
  String get moneyFormatterString {
    String moneyFormatter;
    if(this==null)
      return '';
    moneyFormatter = NumberFormat.simpleCurrency( locale: 'fa_IR' , name: '', decimalDigits: 0).format(this);
    return  moneyFormatter;


    // moneyFormatter = 'RM${this}'

  }

}