import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/text.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(child: 
  DropdownButton(
    hint: normalText(text: "Choose Category", color: fontGrey),
    value: null,
    isExpanded: true,
    items: const [], 
    onChanged: (value) {}
  )
  ).box.white.padding(const EdgeInsets.symmetric(horizontal: 4)).border(color: Colors.grey).roundedSM.make();
}
