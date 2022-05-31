import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  /// Below is the static instance of Authentication Controller
  /// Used to access it from anywhere in the app
  static AuthenticationController instance = Get.find();

  ///Instance of FirebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;

  ///Creating  a FirebaseUser variable
  late Rx<User?> user;

  @override
  void onReady() {

    ///Initializing the user variable with current user
    ///The user should be type casted to Rx<User?>
    user = Rx<User?>(auth.currentUser);

    ///Binding the stream of authStateChanges() to the user
    user.bindStream(auth.authStateChanges());

    ///Listening ever for user stream
    ever(user, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.REGISTER);
    }
    super.onReady();
  }

}
