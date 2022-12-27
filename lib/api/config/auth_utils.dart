import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/utils/stringapp.dart';


class AuthUtils {
  static AuthUtils instance = AuthUtils();

  static String? _token = "";



  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String? _tokenId;


  Future getToken() async {
    if (_token != null && _token!.isNotEmpty) {
      return _token;
    } else {
      final SharedPreferences prefs = await _prefs;
      _tokenId = prefs.getString(StringApp.TOKEN_ID);
      if (_tokenId != null && _tokenId!.isNotEmpty) {
        _token = _tokenId;
      }
    }
    return _token;
  }


  void setToken(String token) {
    _token = token;
  }

}
