import 'package:get/get.dart';

import '../../utils/cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  static AuthenticationManager to = Get.find();

  final isLogged = false.obs;
  final token = ''.obs;

  void logOut() {
    isLogged.value = false;
    remove();
  }

  Future<void> login(String token,String name,String email) async {
    isLogged.value = true;
    //User data is cached
    await saveUserData(token,name,email);
  }

  bool checkLoginStatus() {

    token.value = getToken()??'';
    if (token.isNotEmpty == true) {
      isLogged.value = true;
    }
    return isLogged.value;
  }

}