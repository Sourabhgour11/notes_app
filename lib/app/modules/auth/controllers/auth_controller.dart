import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('loggedIn') ?? false;

    // Decide initial screen
    if (isLoggedIn.value) {
      Get.offAllNamed(Routes.home);
    }
  }

  Future<void> login(String username, String password) async {
    // Fake login: any non-empty credentials succeed.
    if (username.trim().isNotEmpty && password.trim().isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      isLoggedIn.value = true;
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar('Login failed', 'Please enter valid credentials');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    isLoggedIn.value = false;
    Get.offAllNamed(Routes.login);
  }
}
