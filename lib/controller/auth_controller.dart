import 'package:firebase_auth/firebase_auth.dart';
import 'package:wood_mart_seller/const/consts.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
//text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

// signin method

  Future<UserCredential?> signinMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      currentVendor = userCredential.user;
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signout method

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
