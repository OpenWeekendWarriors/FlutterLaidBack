import 'package:flutter_laid_back/conf/laid_back_config.dart';
import 'package:get/get.dart';

final laidBackConfig = Get.find<LaidBackConfig>();

injectLaidBackDependency(LaidBackConfig laidBackConfig) async {
  Get.put(laidBackConfig);
}
