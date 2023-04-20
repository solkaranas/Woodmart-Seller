import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/text.dart';


Widget dashboardButton(context, {title, count,icon}) {
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            boldText(text: title, color: white, size: 16.0),
            boldText(text: count, color: white, size: 20.0)
          ],
        ),
      ),
      Image.asset(
        icon,
        color: Colors.white,
        width: 40,
      ),
    ],
  )
      .box
      .color(black)
      .rounded
      .size(size.width * 0.4, 80)
      .padding(const EdgeInsets.all(8.0))
      .make();
}
