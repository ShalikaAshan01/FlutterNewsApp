import 'package:get/get.dart';

import '../../utils/cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  static AuthenticationManager to = Get.find();

  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    changeLoginStatus(false);
  }

  Future<void> register(String email, String password) async {
    isLogged.value = true;
    saveUserData(email, password);
    changeLoginStatus(true);
  }

  bool checkLoginStatus() {
    bool status = getLoggedInStatus() ?? false;
    isLogged.value = status;
    print(status);
    return isLogged.value;
  }
}
