//
//
//
//
// //region Company Type
// import 'package:smartboom_tv/model/enum/company_type.dart';
//
// extension CompanyType on EnumCompanyType {
//   String get getCompanyTypeString {
//     switch (this) {
//       case EnumCompanyType.PublicLimited:
//         return 'سهامی عام';
//         break;
//       case EnumCompanyType.PrivatelyHeld:
//         return 'سهامی خاص';
//         break;
//       case EnumCompanyType.LimitedResponsibility:
//         return 'مسئولیت محدود';
//         break;
//       case EnumCompanyType.Cooperative:
//         return 'تعاونی';
//         break;
//     }
//     return '';
//     // moneyFormatter = 'RM${this}'
//   }
// }
//
// extension enumToIntCompanyType on EnumCompanyType {
//   int get getEnumToIntCompanyType {
//     switch (this) {
//       case EnumCompanyType.PublicLimited:
//         return 1;
//         break;
//       case EnumCompanyType.PrivatelyHeld:
//         return 2;
//         break;
//       case EnumCompanyType.LimitedResponsibility:
//         return 3;
//         break;
//       case EnumCompanyType.Cooperative:
//         return 4;
//         break;
//     }
//     return 1;
//     // moneyFormatter = 'RM${this}'
//   }
// }
//
// extension IntToEnumCompanyType on int {
//   EnumCompanyType? get getIntToEnumCompanyType {
//     switch (this) {
//       case 1:
//         return EnumCompanyType.PublicLimited;
//         break;
//       case 2:
//         return EnumCompanyType.PrivatelyHeld;
//         break;
//       case 3:
//         return EnumCompanyType.LimitedResponsibility;
//         break;
//       case 4:
//         return EnumCompanyType.Cooperative;
//         break;
//     }
//   }
// }
//
