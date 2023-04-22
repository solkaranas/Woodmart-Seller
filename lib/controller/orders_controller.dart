import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_mart_seller/const/consts.dart';

class OrderController extends GetxController {
  var orders = [];

  var confirmed = false.obs;
  var onDelivery = false.obs;
  var delivered = false.obs;

  getOrders(data) {
    orders.clear();
    for (var item in data['orders']) {
      if (item['vendor_id'] == currentVendor!.uid) {
        orders.add(item);
      }
    }
  }

  changeStatus({title,status, docID}) async {
    var store = firestore.collection(ordersCollection).doc(docID);
    await store.set(
      {
      title : status  
      },SetOptions(merge: true)
    );
  }
}
