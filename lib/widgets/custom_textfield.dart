import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/text.dart';

Widget customTextfield({title,hint,controller,isDesc= false}) {
  return TextField(
    maxLines: isDesc? 4:1,
    decoration: InputDecoration(
      label: normalText(text: title,color: fontGrey),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: white)),
           focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: black)),
          
      hintText: hint,

     
    ),
    controller: controller,
  );
}
