import 'package:get/state_manager.dart';

class Controller extends GetxController {
  var colorInt = "".obs;
  var color = "000000".obs;

  setColorInt(String value) {
    if (value.isEmpty) {
      value = "000000";
    }
    colorInt.value = value;
    colorInt.refresh();
  }

  setColor(String value) {
    if (value.isEmpty) {
      value = "000000";
    }
    color.value = value;
    color.refresh();
  }
}
