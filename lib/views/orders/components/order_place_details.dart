import 'package:wood_mart_seller/const/consts.dart';

import 'package:wood_mart_seller/widgets/text.dart';Widget orderPlaceDetails({title1,title2,d1,d2,color =Colors.red}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          boldText(text: "$title1",color: black),
          boldText(text:"$d1",color: color),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "$title2",color: black),
          boldText(text:"$d2",color: fontGrey),
            ],
          ),
        )
      ],
    ),
  );
}