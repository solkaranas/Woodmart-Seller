import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/orders_controller.dart';
import 'package:wood_mart_seller/widgets/our_button.dart';
import 'package:wood_mart_seller/widgets/text.dart';

import 'components/order_place_details.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({super.key, this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<OrderController>();

  @override
  void initState() {
    controller.getOrders(widget.data);
    controller.confirmed.value=widget.data['order_confirmed'];
    controller.onDelivery.value=widget.data['order_on_delivery'];
    controller.delivered.value=widget.data['order_delivered'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: black,
              )),
          title: boldText(text: "Order Detail", color: fontGrey, size: 16.0),
        ),
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: ourButton(
              color: green,
              onPress: () {
                controller.confirmed(true);
                controller.changeStatus(
                    title: "order_confirmed",
                    status: true,
                    docID: widget.data.id);
              },
              title: "Confirm Order",
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //order delivery status
                Visibility(
                  visible: controller.confirmed.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(text: "Order Status:", size: 16.0),
                      SwitchListTile(
                        value: true,
                        activeColor: green,
                        onChanged: (value) {},
                        title: boldText(
                          text: "Placed",
                        ),
                      ),
                      SwitchListTile(
                        value: controller.confirmed.value,
                        activeColor: green,
                        onChanged: (value) {
                          controller.confirmed.value = value;
                           controller.changeStatus(
                    title: "order_confirmed",
                    status: value,
                    docID: widget.data.id);
                        },
                        title: boldText(
                          text: "Confirmed",
                        ),
                      ),
                      SwitchListTile(
                        value: controller.onDelivery.value,
                        activeColor: green,
                        onChanged: (value) {
                          controller.onDelivery.value = value;
                controller.changeStatus(
                    title: "order_on_delivery",
                    status: value,
                    docID: widget.data.id);
                        },
                        title: boldText(
                          text: "On Delivery",
                        ),
                      ),
                      SwitchListTile(
                        value: controller.delivered.value,
                        activeColor: green,
                        onChanged: (value) {
                          controller.delivered.value = value;
                controller.changeStatus(
                    title: "order_delivered",
                    status: value,
                    docID: widget.data.id);
                        },
                        title: boldText(
                          text: "Delivered",
                        ),
                      ),
                    ],
                  )
                      .box
                      .padding(const EdgeInsets.all(8))
                      .outerShadowMd
                      .border(color: lightGrey)
                      .roundedSM
                      .white
                      .make(),
                ),

                // order deetails Section
                Column(
                  children: [
                    orderPlaceDetails(
                        d1: "${widget.data['order_code']}",
                        d2: "${widget.data['shipping_method']}",
                        title1: "Order Code",
                        title2: "Shipping Method"),
                    orderPlaceDetails(
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format((widget.data['order_date'].toDate())),
                        d2: " ${widget.data['payment_method']}",
                        title1: "Order Date",
                        title2: "Payment Method"),
                    orderPlaceDetails(
                        d1: widget.data['shipping_method']=="COD"?"Unpaid":"Paid",
                        d2: "Order Placed",
                        title1: "Payment Status",
                        title2: "Delivery Status",
                        color:  widget.data['shipping_method']=="COD"?red:green
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(text: "Shipping Address", color: black),
                              "${widget.data['order_by_name']}".text.make(),
                              "${widget.data['order_by_email']}".text.make(),
                              "${widget.data['order_by_address']}".text.make(),
                              "${widget.data['order_by_city']}".text.make(),
                              "${widget.data['order_by_state']}".text.make(),
                              "${widget.data['order_by_phone']}".text.make(),
                              "${widget.data['order_by_postalcode']}"
                                  .text
                                  .make(),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                boldText(text: "Total Amount", color: black),
                                boldText(
                                    text: "₹${widget.data['total_amount']}",
                                    color: red,
                                    size: 16.0),
                                //  "Total Amount".text.fontFamily(semibold).make(),
                                // "${data['total_amount']}".text.color(redColor).fontFamily(bold).make()
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
                    .box
                    .outerShadowMd
                    .border(color: lightGrey)
                    .roundedSM
                    .white
                    .make(),
                10.heightBox,
                boldText(text: "Ordered Products", color: fontGrey, size: 16.0),
                10.heightBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(controller.orders.length, (index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlaceDetails(
                              title1: "${controller.orders[index]['title']}",
                              title2: "\$${controller.orders[index]['tprice']}",
                              d1: "${controller.orders[index]['qty']} x",
                              d2: "Refundable"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: 30,
                              height: 15,
                              color: Color(controller.orders[index]['color']),
                            ),
                          ),
                          const Divider(),
                        ]);
                  }).toList(),
                )
                    .box
                    .outerShadowMd
                    .white
                    .margin(const EdgeInsets.only(bottom: 4))
                    .make(),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
