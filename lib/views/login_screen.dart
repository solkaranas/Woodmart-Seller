import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/const/image.dart';
import 'package:wood_mart_seller/controller/auth_controller.dart';
import 'package:wood_mart_seller/views/home_screen/home.dart';
import 'package:wood_mart_seller/widgets/our_button.dart';
import 'package:wood_mart_seller/widgets/text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightBox,
            normalText(text: welcome, size: 18.0),
            20.heightBox,
            Row(
              children: [
                Image.asset(
                  icApp,
                  width: 80,
                  height: 80,
                ),
                10.widthBox,
                boldText(text: appName, size: 18.0)
              ],
            ),
            40.heightBox,
            normalText(
                text: "Log in to your Account", size: 18.0, color: darkGrey),
            10.heightBox,
            Obx(
              () => Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: emailHint,
                    ),
                  ),
                  10.heightBox,
                  TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: passwordHint,
                    ),
                  ),
                  20.heightBox,
                  SizedBox(
                    width: context.screenWidth - 100,
                    child: controller.isLoading.value ? const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(black),)): ourButton(
                      title: login,
                      onPress: () async {
                        controller.isLoading(true);
                        await controller
                            .signinMethod(context: context)
                            .then((value) {
                          if (value != null) {
                            VxToast.show(context,
                                msg: "Logged in Successfully");
                            controller.isLoading(false);
                            Get.offAll(() => const Home());
                          } else {
                            controller.isLoading(false);
                          }
                        });
                      },
                    ),
                  )
                ],
              )
                  .box
                  .rounded
                  .color(lightGrey)
                  .outerShadowMd
                  .padding(const EdgeInsets.all(8))
                  .make(),
            ),
            10.heightBox,
            Center(
              child: normalText(text: anyProblem, color: Colors.grey.shade700),
            ),
            const Spacer(),
            Center(
              child: normalText(text: credit, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
