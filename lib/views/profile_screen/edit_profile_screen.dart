import 'dart:io';

import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/profile_controller.dart';
import 'package:wood_mart_seller/widgets/custom_textfield.dart';
import 'package:wood_mart_seller/widgets/text.dart';

import '../../const/image.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();
  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          iconTheme: const IconThemeData(color: black),
          backgroundColor: white,
          title: boldText(text: "Edit Profile", size: 16.0),
          actions: [
            Center(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(black),
                      ))
                    : TextButton(
                        onPressed: () async {
                          controller.isLoading(true);

                          //if image is not selected
                          if (controller.profileImgPath.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink =
                                controller.snapshotData['imageUrl'];
                          }

                          if (controller.snapshotData['password'] ==
                              controller.oldpasssController.text) {
                            await controller.changeAuthPassword(
                                email: controller.snapshotData['email'],
                                password: controller.oldpasssController.text,
                                newpassword:
                                    controller.newpasssController.text);

                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.newpasssController.text,
                            );
                            // ignore: use_build_context_synchronously
                            VxToast.show(context, msg: "Updated");
                          } else if (controller
                                  .oldpasssController.text.isEmptyOrNull &&
                              controller
                                  .newpasssController.text.isEmptyOrNull) {
                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.snapshotData['password'],
                            );
                            // ignore: use_build_context_synchronously
                            VxToast.show(context, msg: "Updated");
                          } else {
                            // ignore: use_build_context_synchronously
                            VxToast.show(context, msg: "Some Error Occured");
                            controller.isLoading(false);
                          }
                        },
                        child: normalText(text: "Save")))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              controller.snapshotData['imageUrl'] == '' &&
                      controller.profileImgPath.isEmpty
                  ? Image.asset(
                      icStar,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : controller.snapshotData['imageUrl'] != '' &&
                          controller.profileImgPath.isEmpty
                      ? Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: black),
                      onPressed: () {
                        controller.changeImage(context);
                      },
                      child: normalText(text: "Change", color: white))
                  .box
                  .rounded
                  .make(),
              10.heightBox,
              const Divider(
                color: textFieldGrey,
              ),
              10.heightBox,
              customTextfield(
                  title: name,
                  hint: nameHint,
                  controller: controller.nameController),
              20.heightBox,
              Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Change your Password")),
              10.heightBox,
              customTextfield(
                  title: password,
                  hint: passwordHint,
                  controller: controller.oldpasssController),
              10.heightBox,
              customTextfield(
                  title: "Confirm Password",
                  hint: passwordHint,
                  controller: controller.newpasssController)
            ],
          ),
        ),
      ),
    );
  }
}
