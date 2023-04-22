import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/home_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  //text field controllers

  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();
  var categoryList = <String>[].obs;

  var pimagesLinks = [];
  var pimagesList = RxList<dynamic>.generate(3, (index) => null);

  var categoryValue = "".obs;
  var selectedColorIndex = 0.obs;

  pickImage(index, context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) {
        return;
      } else {
        pimagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages() async {
    pimagesLinks.clear();
    for (var item in pimagesList) {
      if (item != null) {
        var filename = basename(item.path);
        var destination = 'vendors/${currentVendor!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();

        pimagesLinks.add(n);
      }
    }
  }

  uploadProduct(context) async {
    var store = firestore.collection(productsCollection).doc();
    await store.set({
      'is_featured': false,
      'p_category': categoryValue.value,
      'p_colors': FieldValue.arrayUnion([
        Colors.red.value,
        Colors.black.value,
        Colors.green.value,
        Colors.amber.value,
        Colors.teal.value
      ]),
      'p_imgs': FieldValue.arrayUnion(pimagesLinks),
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_desc': pdescController.text,
      'p_name': pnameController.text,
      'p_price': ppriceController.text,
      'p_quantity': pquantityController.text,
      'p_seller': Get.find<Homecontroller>().vendorname,
      'p_rating': "5.0",
      'vendor_id': currentVendor!.uid,
      'featured_id': '',
    });
    isLoading(false);
    VxToast.show(context, msg: "Product Uploaded");
  }

  addFeatured(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'featured_id': currentVendor!.uid,
      'is_featured': true,
    }, SetOptions(merge: true));
  }

  removeFeatured(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'featured_id': '',
      'is_featured': false,
    }, SetOptions(merge: true));
  }

  removeProduct(docId) async {
    await firestore.collection(productsCollection).doc(docId).delete();
  }
}
