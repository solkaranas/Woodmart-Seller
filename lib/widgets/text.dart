import "package:wood_mart_seller/const/consts.dart";

Widget normalText({text, size = 14.0, color = Colors.black}) {
  return "$text".text.color(color).size(size).make();
}

Widget boldText({text, color = Colors.black, size = 14.0}) {
  return "$text".text.color(color).size(size).fontWeight(FontWeight.bold).make();
}

