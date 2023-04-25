import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/const/image.dart';
import 'package:wood_mart_seller/controller/orders_controller.dart';
import 'package:wood_mart_seller/services/store_services.dart';
import 'package:wood_mart_seller/views/products/product_details.dart';
import 'package:wood_mart_seller/widgets/appbar_widget.dart';
import 'package:wood_mart_seller/widgets/dashboard_button.dart';
import 'package:wood_mart_seller/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var orderController = Get.put(OrderController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarWidget(dashboard),
        body: StreamBuilder(
            stream: StoreServices.getProducts(currentVendor!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(black),
                ));
              } else {
                var data = snapshot.data!.docs;
                data = data.sortedBy((a, b) =>
                    b['p_wishlist'].length.compareTo(a['p_wishlist'].length));
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          dashboardButton(context,
                              title: product,
                              count: "${data.length}",
                              icon: icProduct),
                          dashboardButton(context,
                              title: orders, count: orderController.orders.length, icon: icOrders)
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          dashboardButton(context,
                              title: rating, count: "60", icon: icStar),
                          dashboardButton(context,
                              title: totalSales, count: "15", icon: icOrders)
                        ],
                      ),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      boldText(text: popular, color: fontGrey, size: 16.0),
                      20.heightBox,
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            data.length,
                            (index) => data[index]['p_wishlist'].length == 0
                                ? const SizedBox()
                                : ListTile(
                                    onTap: () {
                                      Get.to(() => ProductDetails(
                                            data: data[index],
                                          ));
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
                                    subtitle: normalText(
                                        text: "₹${data[index]['p_price']}",
                                        color: darkGrey),
                                  )),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
