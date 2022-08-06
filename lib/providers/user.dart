import 'package:cff_ap/api_models/token_auth_response.dart';
import 'package:cff_ap/services/secure_storage_manager.dart';
import 'package:flutter/cupertino.dart';

import '../services/api_manager.dart';

class User extends ChangeNotifier {
  String authToken = "";
  bool isLogged = false;

  Future<bool> login(String email, String password) async {
    Future<TokenAuthResponse>? _futureToken =
        createTokenAuthResponse(email, password);
    // _futureToken.then((tokenData) {
    //   if(tokenData.token.isNotEmpty){
    //     authToken = tokenData.token;
    //     isLogged = true;
    //     saveUserAuthToken(authToken);
    //     notifyListeners();
    //     return true;
    //   }
    //   else {
    //     return false;
    //   }
    // });
    final tokenData = await _futureToken;
    if(tokenData is TokenAuthResponse){
      if (tokenData.token.isNotEmpty) {
        authToken = tokenData.token;
        isLogged = true;
        saveUserAuthToken(authToken);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
    else return false;
  }

  void logout() {
    deleteUserAuthToken();
    authToken = "";
    isLogged = false;
    notifyListeners();
  }

  Future<bool> initUser() async {
    final savedToken = await getUserAuthToken();
    if (savedToken != null) {
      authToken = savedToken;
      isLogged = true;
      return true;
    }
    return false;
  }
}
