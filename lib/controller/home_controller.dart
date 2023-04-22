import 'package:wood_mart_seller/const/consts.dart';

class Homecontroller extends GetxController {
  @override
  void onInit() {
    getVendorName();
    super.onInit();
  }

  var navIndex = 0.obs;
  var vendorname = "";

  getVendorName() async {
    var n = await firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: currentVendor!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendor_name'];
      }
    });
    vendorname = n;
  }
}
