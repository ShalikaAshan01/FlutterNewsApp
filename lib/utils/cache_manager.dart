import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  ///save user data
  Future<bool> saveUserData(String token, String name, String email) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    await box.write(CacheManagerKey.email.toString(), email);
    await box.write(CacheManagerKey.name.toString(), name);
    return true;
  }

  /// get user token
  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  /// get saved user's email
  String? getEmail() {
    final box = GetStorage();
    return box.read(CacheManagerKey.email.toString());
  }

  /// get saved user's name
  String? getName() {
    final box = GetStorage();
    return box.read(CacheManagerKey.name.toString());
  }

  /// remove user data
  Future<void> remove() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.token.toString());
  }
}

enum CacheManagerKey { token, name, email }
