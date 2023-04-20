import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/const/image.dart';
import 'package:wood_mart_seller/widgets/appbar_widget.dart';
import 'package:wood_mart_seller/widgets/dashboard_button.dart';
import 'package:wood_mart_seller/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget(dashboard),
      body: Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            dashboardButton(context,
         title: product,
         count: "60",icon: icProduct),
           dashboardButton(context,
         title: orders,
         count: "15",icon: icOrders)
        ],
    
       ),
       10.heightBox,
         Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            dashboardButton(context,
         title: rating,
         count: "60",icon: icStar),
           dashboardButton(context,
         title: totalSales,
         count: "15",icon: icOrders)
        ],
       ),
       10.heightBox,
       const Divider(),
       10.heightBox,
       boldText(text: popular,color: fontGrey,size: 16.0),
       20.heightBox,
       ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        
        children: List.generate(3, (index) => ListTile(
          onTap: (){},
          leading: Image.asset(icApp,width: 100,height: 100,fit: BoxFit.cover,),
          title: boldText(text: "Product title",color: fontGrey),
          subtitle: normalText(text: "\$40.0",color: darkGrey),
        )),
       )
        ],
      ),
      ),
    );
  }
}
