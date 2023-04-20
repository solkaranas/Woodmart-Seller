import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/views/products/add_product.dart';
import 'package:wood_mart_seller/views/products/product_details.dart';
import 'package:wood_mart_seller/widgets/appbar_widget.dart';

import '../../const/image.dart';
import '../../widgets/text.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () {
          Get.to(()=>const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: appBarWidget(product),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const ProductDetails());
                        },
                        leading: Image.asset(
                          icApp,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(text: "Product title", color: fontGrey),
                        subtitle: Row(
                          children: [
                            normalText(text: "\$40.0", color: darkGrey),
                            10.widthBox,
                            boldText(text: "Featured",color: green)
                          ],
                        ),
                        trailing: VxPopupMenu(
                            arrowSize: 0,
                            menuBuilder: () => Column(
                                  children: List.generate(
                                      popupMenuIconList.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              children: [
                                                Icon(popupMenuIconList[index]),
                                                10.widthBox,
                                                normalText(
                                                    text: popupMenuTitlelist[
                                                        index],
                                                    color: darkGrey)
                                              ],
                                            ).onTap(() {}),
                                          )),
                                ).box.white.rounded.width(200).make(),
                            clickType: VxClickType.singleClick,
                            child: const Icon(Icons.more_vert_rounded)),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
