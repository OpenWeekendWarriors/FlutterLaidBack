
import 'package:flutter_laid_back/extention/enum_action.dart';

extension StringActionToEnumAction on String {
  EnumAction? get getEnumActionFromActionString {
    switch (this) {
      case 'dataInvalid':
        return EnumAction.DATA_INVALID;
      case 'KeyInvalid':
        return EnumAction.KEY_INVALID;
      case 'stuset':
        return EnumAction.STU_SET;
      case 'OK':
        return EnumAction.OK;
      case 'NOAN':
        return EnumAction.NOAN;
      case 'NORF':
        return EnumAction.NORF;
      case 'NORE':
        return EnumAction.NORE;
      case 'keyok':
        return EnumAction.KEY_OK;
      case 'NODD':
        return EnumAction.NODD;
      case 'DC':
        return EnumAction.DC;
      case 'NONA':
        return EnumAction.NONA;
      case 'NOSI':
        return EnumAction.NOSI;
      case 'NOBR':
        return EnumAction.NOBR;
      case 'NODE':
        return EnumAction.NODE;
      case 'NOAA':
        return EnumAction.NOAA;
      default:
        return EnumAction.NONE;
    }
  }
}

extension EnumActionToStringAction on EnumAction {
  String? get getActionStringFromEnumAction {
    switch (this) {
      case EnumAction.DATA_INVALID:
        return 'dataInvalid';
      case EnumAction.KEY_INVALID:
        return 'KeyInvalid';
      case EnumAction.STU_SET:
        return 'stuset';
      case EnumAction.OK:
        return 'OK';
      case EnumAction.NOAN:
        return 'NOAN';
      case EnumAction.NORF:
        return 'NORF';
      case EnumAction.NORE:
        return 'NORE';
      case EnumAction.KEY_OK:
        return 'keyok';
      case EnumAction.NODD:
        return 'NODD';
      case EnumAction.DC:
        return 'DC';
      case EnumAction.NONA:
        return 'NONA';
      case EnumAction.NOSI:
        return 'NOSI';
      case EnumAction.NOBR:
        return 'NOBR';
      case EnumAction.NODE:
        return 'NODE';
      case EnumAction.NOAA:
        return 'NOAA';
      default:
        return '';
    }
  }
}

