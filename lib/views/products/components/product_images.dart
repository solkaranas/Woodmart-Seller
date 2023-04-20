import 'package:wood_mart_seller/const/consts.dart';

Widget productImage({required label,onPress,}) {
  return "$label".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100, 100).roundedSM.make();
}
