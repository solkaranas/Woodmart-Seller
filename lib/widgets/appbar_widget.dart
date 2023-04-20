import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/text.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;


AppBar appBarWidget(title) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: fontGrey, size: 16.0),
    backgroundColor: Colors.white,
     actions: [
          Center(
            child: normalText(
              text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
            ),
          ),
                      10.widthBox
        ],
  );
}
