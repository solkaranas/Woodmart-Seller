import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/product_controller.dart';
import 'package:wood_mart_seller/services/store_services.dart';
import 'package:wood_mart_seller/views/products/add_product.dart';
import 'package:wood_mart_seller/views/products/product_details.dart';
import 'package:wood_mart_seller/widgets/appbar_widget.dart';

import '../../widgets/text.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () async {
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: appBarWidget(product),
      body: StreamBuilder(
          stream: StoreServices.getProducts(currentVendor!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(black),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length,
                        (index) => Card(
                              child: ListTile(
                                onTap: () {
                                  Get.to(
                                      () => ProductDetails(data: data[index]));
                                },
                                leading: Image.network(
                                  data[index]['p_imgs'][0],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                title: boldText(
                                    text: "${data[index]['p_name']}",
                                    color: fontGrey),
                                subtitle: Row(
                                  children: [
                                    normalText(
                                        text: "\$${data[index]['p_price']}",
                                        color: darkGrey),
                                    10.widthBox,
                                    boldText(
                                        text: data[index]['is_featured'] == true
                                            ? "Featured"
                                            : "",
                                        color: green)
                                  ],
                                ),
                                trailing: VxPopupMenu(
                                    arrowSize: 0,
                                    menuBuilder: () => Column(
                                          children: List.generate(
                                              popupMenuIconList.length,
                                              (i) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          popupMenuIconList[i],
                                                          color: data[index][
                                                                          'featured_id'] ==
                                                                      currentVendor!
                                                                          .uid &&
                                                                  i == 0
                                                              ? green
                                                              : darkGrey,
                                                        ),
                                                        10.widthBox,
                                                        normalText(
                                                            text: data[index][
                                                                            'featured_id'] ==
                                                                        currentVendor!
                                                                            .uid &&
                                                                    i == 0
                                                                ? "Remove Featured"
                                                                : popupMenuTitlelist[
                                                                    i],
                                                            color: darkGrey)
                                                      ],
                                                    ).onTap(() {
                                                      switch (i) {
                                                        case 0:
                                                          if (data[index][
                                                                  'is_featured'] ==
                                                              true) {
                                                            controller
                                                                .removeFeatured(
                                                                    data[index]
                                                                        .id);
                                                          } else {
                                                            controller
                                                                .addFeatured(
                                                                    data[index]
                                                                        .id);
                                                            VxToast.show(
                                                                context,
                                                                msg: "Added");
                                                          }
                                                          break;
                                                       case 1:
                                                          controller
                                                              .removeProduct(
                                                                  data[index]
                                                                      .id);
                                                          VxToast.show(context,
                                                              msg:
                                                                  "Product Removed");
                                                          break;
                                                        default:
                                                      }
                                                    }),
                                                  )),
                                        ).box.white.rounded.width(200).make(),
                                    clickType: VxClickType.singleClick,
                                    child: const Icon(Icons.more_vert_rounded)),
                              ),
                            )),
                  ),
                ),
              );
            }
          }),
    );
  }
}
