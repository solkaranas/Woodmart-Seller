import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/text.dart';

Widget ourButton({title, color = Colors.black,onPress} ){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      )

    ),
    onPressed: onPress, 
    child: boldText(text: title,size: 16.0,color: Colors.white));
}