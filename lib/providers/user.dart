import 'package:cff_ap/api_models/token_auth_response.dart';
import 'package:cff_ap/services/secure_storage_manager.dart';
import 'package:flutter/cupertino.dart';

import '../services/api_manager.dart';

class User extends ChangeNotifier {
  String authToken = "";
  bool isLogged = false;

  void login(String email, String password) {
    Future<TokenAuthResponse>? _futureToken =
        createTokenAuthResponse(email, password);
    _futureToken.then((tokenData) {
      authToken = tokenData.token;
      isLogged=true;
      print('auth token' + authToken);
      saveUserAuthToken(authToken);
      notifyListeners();
    });
  }

  void logout() {
    deleteUserAuthToken();
    authToken = "";
    isLogged=false;
    notifyListeners();
  }

  Future<bool> initUser() async {
    final savedToken = await getUserAuthToken();
    if (savedToken != null) {
      authToken = savedToken;
      isLogged = true;
      return  true;
    }
    return false;
  }

}
