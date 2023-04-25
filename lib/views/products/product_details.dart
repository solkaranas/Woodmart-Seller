import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/widgets/text.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
                height: 350,
                itemCount: data['p_imgs'].length,
                itemBuilder: (context, index) {
                  return Image.network(
                    data['p_imgs'][index],
                    //    data['p_imgs'][index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "${data['p_name']}", size: 16.0),
                  10.heightBox,
                  boldText(
                      text: "${data['p_category']}",
                      color: fontGrey,
                      size: 16.0),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textFieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  boldText(
                      text: "₹${data['p_price']}", color: black, size: 18.0),
                  const Divider(),
                  10.heightBox,
                  description.text
                      .size(20)
                      .fontWeight(FontWeight.bold)
                      .color(Colors.black)
                      .make(),
                  5.heightBox,
                  "${data['p_desc']}"
                      .text
                      .size(15)
                      .fontWeight(FontWeight.w300)
                      .color(Colors.black)
                      .make(),
                  const Divider(),
                  15.heightBox,
                  "Color"
                      .text
                      .size(20)
                      .fontWeight(FontWeight.bold)
                      .color(Colors.black)
                      .make(),
                  10.heightBox,
                  Row(
                    children: List.generate(
                      data['p_colors'].length,
                      (index) => VxBox()
                          .size(40, 40)
                          .roundedFull
                          .color(
                              Color(data['p_colors'][index]).withOpacity(1.0))
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make()
                          .onTap(() {}),
                    ),
                  ),
                  15.heightBox,
                  Row(
                    children: [
                      "Quantity :"
                          .text
                          .size(20)
                          .fontWeight(FontWeight.bold)
                          .color(Colors.black)
                          .make(),
                      15.widthBox,
                      normalText(
                          text: "${data['p_quantity']} items",
                          color: fontGrey,
                          size: 18.0)
                    ],
                  ),
                  10.heightBox,
                ],
              ).box.padding(const EdgeInsets.all(8)).make(),
            )
          ],
        ),
      ),
    );
  }
}
