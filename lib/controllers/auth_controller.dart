import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/views/add_details/add_details_screen.dart';
import 'package:job_den/views/placeholder_screen.dart';

class AuthController extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userController.setUserInfo(user?.uid, user?.email, "", "", "", "", "", 0, "", "", []);
      Get.to(() => AddDetailsScreen());
    } catch (err) {
      Get.snackbar(
        "Error creating account",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }



  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (err) {
      Get.snackbar(
        "Error logging in",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.to(() => const PlaceHolderScreen());
    } catch (err) {
      Get.snackbar(
        "Error signing out",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.snackbar(
        "Reset Password",
        "An email has been sent to $email. Please check you inbox and reset the password",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      Get.snackbar(
        "Error resetting password",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}