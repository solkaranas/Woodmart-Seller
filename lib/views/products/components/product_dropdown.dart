import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/product_controller.dart';
import 'package:wood_mart_seller/widgets/text.dart';

Widget productDropdown(hint, List<String> list, dropValue,ProductController controller) {
  return Obx(
    ()=> DropdownButtonHideUnderline(
            child: DropdownButton(
                hint: normalText(text: "$hint", color: fontGrey),
                value: dropValue.value == "" ? null : dropValue.value,
                isExpanded: true,
                items: list.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: e.toString().text.make(),
                  );
                }).toList(),
                onChanged: (newValue) {
                  dropValue.value = newValue.toString();
                }))
        .box
        .white
        .padding(const EdgeInsets.symmetric(horizontal: 4))
        .border(color: Colors.grey)
        .roundedSM
        .make(),
  );
}
