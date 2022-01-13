import 'package:get/get.dart';
import 'package:template/pages/laboratory/laboratory_controller.dart';

class LaboratoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaboratoryController>(() => LaboratoryController());
  }

}