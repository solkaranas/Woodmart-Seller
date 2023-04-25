import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/orders_controller.dart';
import 'package:wood_mart_seller/services/store_services.dart';
import 'package:wood_mart_seller/views/orders/order_details.dart';
import 'package:wood_mart_seller/widgets/appbar_widget.dart';

import '../../widgets/text.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderController());

    return Scaffold(
      appBar: appBarWidget(orders),
      body: StreamBuilder(
          stream: StoreServices.getOrders(currentVendor!.uid),
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
                    children: List.generate(data.length, (index) {
                      var time = data[index]['order_date'].toDate();
                      return ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onTap: () {
                          Get.to(() =>  OrderDetails(data: data[index]));
                        },
                        tileColor: textFieldGrey,
                        title: boldText(
                            text: "${data[index]['order_code']}", color: black),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: fontGrey,
                                ),
                                10.widthBox,
                                boldText(
                                    text: intl.DateFormat()
                                        .add_yMd()
                                        .format(time),
                                    color: fontGrey)
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.payment,
                                  color: fontGrey,
                                ),
                                10.widthBox,
                                boldText(text: unpaid, color: red)
                              ],
                            )
                          ],
                        ),
                        trailing:
                            boldText(text: "₹${data[index]['total_amount']}", color: black, size: 16.0),
                      ).box.margin(const EdgeInsets.only(bottom: 4)).make();
                    }),
                  ),
                ),
              );
            }
          }),
    );
  }
}
