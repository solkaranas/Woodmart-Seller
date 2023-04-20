import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/views/orders/order_details.dart';
import 'package:wood_mart_seller/widgets/appbar_widget.dart';

import '../../widgets/text.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onTap: () {
                  Get.to(() => const OrderDetails());
                },
                tileColor: textFieldGrey,
                title: boldText(text: "210399", color: black),
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
                                .format(DateTime.now()),
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
                trailing: boldText(text: "\$40.0", color: black, size: 16.0),
              ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
            ),
          ),
        ),
      ),
    );
  }
}
