import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/const/image.dart';
import 'package:wood_mart_seller/controller/auth_controller.dart';
import 'package:wood_mart_seller/controller/profile_controller.dart';
import 'package:wood_mart_seller/services/store_services.dart';
import 'package:wood_mart_seller/views/login_screen.dart';
import 'package:wood_mart_seller/views/profile_screen/edit_profile_screen.dart';
import 'package:wood_mart_seller/widgets/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        title: boldText(text: setting, size: 16.0, color: black),
      ),
      backgroundColor: white,
      body: FutureBuilder(
          future: StoreServices.getProfile(currentVendor!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(black),
                ),
              );
            } else {
              // print(">>>>>>>>>>>> ${snapshot.data!.docs.length}");
              if (snapshot.data!.docs.isNotEmpty) {
                controller.snapshotData = snapshot.data!.docs.first;
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset(icApp)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make(),
                      title: boldText(text: "Vendor", size: 16.0),
                      subtitle: //normalText(text: "ez")
                          normalText(
                              text: "${controller.snapshotData['email']}",
                              color: black),
                    ),
                    const Divider(),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                            settingList.length,
                            (index) => ListTile(
                                  onTap: () async {
                                    switch (index) {
                                      case 0:
                                        Get.to(() => EditProfileScreen(
                                              username: controller
                                                  .snapshotData['vendor_name'],
                                            ));
                                        break;
                                      case 1:
                                        await Get.find<AuthController>()
                                            .signoutMethod(context);
                                        Get.offAll(() => const LoginScreen());
                                        break;
                                      default:
                                    }
                                  },
                                  leading: Icon(
                                    settingIconList[index],
                                    color: index == 1 ? red : black,
                                  ),
                                  title: normalText(
                                      text: settingList[index],
                                      color: index == 1 ? red : black),
                                )),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text("No Data!"));
              }
            }
          }),
    );
  }
}
