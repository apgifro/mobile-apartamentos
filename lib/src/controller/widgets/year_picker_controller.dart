import 'package:get/get.dart';

class YearPickerController extends GetxController {
  var year = DateTime.now().year.toString().obs;
}