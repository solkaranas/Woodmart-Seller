import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/views/products/components/product_dropdown.dart';
import 'package:wood_mart_seller/views/products/components/product_images.dart';
import 'package:wood_mart_seller/widgets/custom_textfield.dart';

import '../../widgets/text.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

         backgroundColor: white,
        elevation: 0,
        title: boldText(text: "Add Product",color: fontGrey,size: 16.0),
         leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: black,)),
            actions: [
              TextButton(onPressed: (){}, child: normalText(text: "Save",))
            ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextfield(
                hint: "eg. BMW",
                title: "Product Name",
              ),
              10.heightBox,
              customTextfield(
                hint: "eg. Nice Product",
                title: "Description",
                isDesc: true
              ),
               10.heightBox,
              customTextfield(
                hint: "eg. \$100",
                title: "Price",
              ),
               10.heightBox,
              customTextfield(
                hint: "eg. 20",
                title: "Quantity",
              ),
              10.heightBox,
              productDropdown(),
              const Divider(color: textFieldGrey,),
              10.heightBox,
              boldText(text: "Choose Product Images"),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) => productImage(label: "${index+1}")),
              ),
              10.heightBox,
              normalText(text: "First image will be your display Image",color: darkGrey),
              const Divider(color: textFieldGrey,),
              10.heightBox,
              boldText(text: "Choose Product Colors"),
              10.heightBox,
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: List.generate(9, (index) => Stack(
                  alignment: Alignment.center,
                  children: [
                    VxBox().color(Vx.randomPrimaryColor).roundedFull.size(70, 70).make(),
                    const Icon(Icons.done,color: white,),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}