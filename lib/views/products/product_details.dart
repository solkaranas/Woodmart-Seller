import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/const/image.dart';
import 'package:wood_mart_seller/widgets/text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: boldText(text: "Product Details",color: fontGrey,size: 16.0),
         leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: black,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             VxSwiper.builder(
                          viewportFraction: 1.0,
                          aspectRatio: 16 / 9,
                          height: 350,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              icApp,
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
                               boldText(text: "Product title",size: 16.0),
                                  10.heightBox,
                                  boldText(text: "Category",color: fontGrey,size: 16.0),
                                  10.heightBox,
                                   VxRating(
                            isSelectable: false,
                           // value: double.parse(data['p_rating']),
                           value: 3.0,
                            onRatingUpdate: (value) {},
                            normalColor: textFieldGrey,
                            selectionColor: golden,
                            count: 5,
                            maxRating: 5,
                            size: 25,
                          ),
                            10.heightBox,
                           
                          boldText(text: "\$300.0",color: black ,size: 18.0),
                          const Divider(),
                          10.heightBox,
                           description.text
                                .size(20)
                                .fontWeight(FontWeight.bold)
                                .color(Colors.black)
                                .make(),
                            5.heightBox,
                            "Description of this Item"
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
                                  3,
                                  (index) => 
                                          VxBox()
                                              .size(40, 40)
                                              .roundedFull
                                              .color(
                                                Vx.randomPrimaryColor
//Color(data['p_colors'][index]).withOpacity(1.0)
)
                                              .margin(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4))
                                              .make()
                                              .onTap(() {
                                            }),
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
                                    normalText(text: "20 items",color: fontGrey,size: 18.0)
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