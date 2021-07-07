import 'package:get/get.dart';
import 'package:home_utility/main.dart';
import 'package:home_utility/model/proData.dart';

class ProController extends GetxController {
  String proID;
  ProController(this.proID);
  var prosData = RxList<ProsData>([]);

  List<ProsData> get pro => prosData;

  @override
  void onInit() {
    super.onInit();
    prosData.bindStream(database.proDataStream(proID: proID));
  }

  @override
  void onClose() {
    super.onClose();
    // userData.close();
  }
}
