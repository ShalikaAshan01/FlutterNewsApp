import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  ///save user data
  Future<bool> saveUserData(String email, String password) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.email.toString(), email);
    await box.write(CacheManagerKey.password.toString(), password);
    await box.write(CacheManagerKey.loggedIn.toString(), true);
    return true;
  }

  void changeLoginStatus(bool status) {
    final box = GetStorage();
    box.write(CacheManagerKey.loggedIn.toString(), status);
  }

  /// get saved user's email
  String? getEmail() {
    final box = GetStorage();
    return box.read(CacheManagerKey.email.toString());
  }

  bool? getLoggedInStatus() {
    final box = GetStorage();
    return box.read(CacheManagerKey.loggedIn.toString());
  }

  /// get saved user's password
  String? getPassword() {
    final box = GetStorage();
    return box.read(CacheManagerKey.password.toString());
  }

  /// remove user data
  Future<void> remove() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.loggedIn.toString());
  }
}

enum CacheManagerKey { email, password, loggedIn }
