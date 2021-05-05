import 'dart:convert';

import 'package:ocwebservice/LocalStore.dart';

import 'OCEndPoint.dart';

abstract class OCAuthurization {
  static String AUTH_MODEL_KEY = "authmodelkey5cdse874";

  OCEndPoint authEndPoint;

  LocalStore localStore;

  AuthModel authModel;

  String loginAPIPath = "";

  String logoutAPIPath = "";

  OCAuthurization({this.authEndPoint,this.localStore,this.loginAPIPath,this.logoutAPIPath}) {
    restoreAuthModelFromLocalStore();
  }

  void restoreAuthModelFromLocalStore() async {
    if (localStore.read(AUTH_MODEL_KEY) != null) {
       authModel = await AuthModel.fromJson(JsonDecoder().convert(localStore.read(AUTH_MODEL_KEY)));
    } else {
      authModel = AuthModel();
    }
  }

  bool shouldCallForNewToken() {
    return DateTime.parse(authModel.expireDate).isAfter(DateTime.now());
  }

  void invalidateAuthToken(){
    authModel = AuthModel();
    localStore.write(AUTH_MODEL_KEY, authModel.makeEncodedString());
  }

  void saveAuthModel(dynamic apiresponse) async {
    authModel = createAuthModelFromAPIResponse(apiresponse);
    await localStore.write(AUTH_MODEL_KEY, authModel.makeEncodedString());

  }

  AuthModel createAuthModelFromAPIResponse(dynamic apiresponse);

}



class AuthModel {
  static String AUTH_TOKEN_KEY = "authToken";
  static String EXPIRE_DATE_KEY = "expireDate";
  static String REFRESH_TOKEN_KEY = "refreshToken";
  String authToken = "";
  String expireDate = "";
  String refreshToken = "";

  AuthModel();

  String makeEncodedString() {
    return JsonEncoder().convert(this);
  }

  factory AuthModel.fromJson(Map<String,dynamic> dic) {
    var model = AuthModel();
    model.authToken = dic[AUTH_TOKEN_KEY];
    model.expireDate = dic[EXPIRE_DATE_KEY];
    model.refreshToken = dic[REFRESH_TOKEN_KEY];
    return model;
  }

}

