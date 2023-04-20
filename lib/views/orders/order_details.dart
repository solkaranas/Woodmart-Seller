import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/our_button.dart';
import 'package:wood_mart_seller/widgets/text.dart';

import 'components/order_place_details.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: black,)),
        title: boldText(text: "Order Detail", color: fontGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(
          color: green,
          onPress: (){},
          title: "Confirm Ordeer",
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
              
               child: Column(
                
                 children: [
                  boldText(text: "Order Status",size: 16.0),
                  SwitchListTile(
                    value: true, 
                    activeColor: green,
                    onChanged: (value){},
                  title: boldText(text: "Placed",),
                  ),
                  SwitchListTile(
                    value: true, 
                    activeColor: green,
                    onChanged: (value){},
                  title: boldText(text: "Confirmed",),
                  ),
                  SwitchListTile(
                    value: false, 
                    activeColor: green,
                    onChanged: (value){},
                  title: boldText(text: "On Delivery",),
                  ),
                  SwitchListTile(
                    value: false, 
                    activeColor: green,
                    onChanged: (value){},
                  title: boldText(text: "Delivered",),
                  ),
                 ],
               ).box.outerShadowMd.border(color: lightGrey).roundedSM.white.make(),
             ),

             // order deetails Section
                Column(
                  children: [
                      orderPlaceDetails( d1: "data['order_code']",d2: "data['shipping_method']",title1: "Order Code", title2: "Shipping Method" ),
                  orderPlaceDetails( d1: DateTime.now(),d2:" data['payment_method']",title1: "Order Date", title2: "Payment Method" ),
                  orderPlaceDetails( d1: "Unpaid",d2:"Order Placed",title1: "Payment Status", title2: "Delivery Status" ),
        
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal :16.0,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldText(text: "Shipping Address",color: black),
                            "{data['order_by_name']}".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            "{data['order_by_postalcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(text: "Total Amount", color: black),
                              boldText(text: "\$300", color: red,size: 16.0),
                            //  "Total Amount".text.fontFamily(semibold).make(),
                             // "${data['total_amount']}".text.color(redColor).fontFamily(bold).make()
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                  ],
                ).box.outerShadowMd.border(color: lightGrey).roundedSM.white.make(),
                10.heightBox,
boldText(text: "Ordered Products", color: fontGrey,size: 16.0),                10.heightBox,
               ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:  List.generate(3, (index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[ orderPlaceDetails(
                      title1: "data['orders'][index]['title']",
                      title2: "data['orders'][index]['tprice']",
                      d1: "{data['orders'][index]['qty']} x",
                      d2: "Refundable"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                        child: Container(
                          width: 30,
                          height: 15,
                          color: purple,
                        ),
                      ),
                      const Divider(),
             ] );
                }).toList(),

                
               ).box.outerShadowMd.white.margin(const EdgeInsets.only(bottom: 4)).make(),
                               20.heightBox,

            ],
          ),
        ),
      ),
    );
  }
}
