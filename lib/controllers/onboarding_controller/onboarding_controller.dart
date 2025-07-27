import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }

  void createAccount() {
    // Replace with your actual CreateAccount screen route or widget
    Get.toNamed('/create-account'); // or Get.to(CreateAccountScreen());
  }

  void signIn() {
    // Replace with your actual SignIn screen route or widget
    Get.toNamed('/sign-in'); // or Get.to(SignInScreen());
  }
}
