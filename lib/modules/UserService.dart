
import '../utils/constant.dart';

import '../model/AuthUser.dart';
import 'MySecureCache.dart';

class UserService {
  MySecureCache cache = MySecureCache();
  late AuthUser _currentUser;
  AuthUser get currentUser => _currentUser; //<----- Cached Here
  // ignore: empty_constructor_bodies
  UserService() {
    _currentUser = AuthUser();
  }

  setUser(AuthUser? user) async {
    if (user!.jwt == null || user.jwt == "") {
      cache.deleteCache(CacheInfor.authCache);
      _currentUser = AuthUser();
    } else {
      _currentUser = user;
      await cache.updateCache(CacheInfor.authCache, user.toMap());
    }
  }

  Future<bool> isLogged() async {
    return cache.readCache(CacheInfor.authCache).then((value) {
      if (value == null) return false;
      _currentUser = AuthUser.fromMap(value);
      return true;
    });
  }
}
