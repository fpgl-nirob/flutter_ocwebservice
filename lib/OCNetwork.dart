import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'OCAuthurization.dart';
import 'OCEndPoint.dart';
import 'OCRequestType.dart';


class OCNetwork {
  String baseURL;
  OCAuthurization authurization;

  OCNetwork(String baseUrl, {this.authurization});

  Future<http.Response> execute(OCEndPoint endPoint) async {
    Map<String,dynamic> headers = await endPoint.getHeaders();
    if(endPoint.needAuth) {
      if (authurization.shouldCallForNewToken()) {
        var response;

        if (authurization.authEndPoint.requestType == OCRequestType.POST) {
          response = await http.post(authurization.authEndPoint.asURL(baseURL),
              headers: authurization.authEndPoint.headers,
            body: authurization.authEndPoint.bodyParams,
            encoding: Encoding.getByName("utf-8")
          );

        } else {
          response = await http.get(authurization.authEndPoint.asURL(baseURL),
              headers: authurization.authEndPoint.headers);

        }
        //TODO: Save new auth
        authurization.saveAuthModel(response);

      }
      headers['Authorization'] = authurization.authModel.authToken;
    }

    switch(endPoint.requestType) {
      case OCRequestType.POST:
        var response = await http.post(endPoint.asURL(baseURL),
            headers: headers,
            body: endPoint.bodyParams,
            encoding: Encoding.getByName("utf-8"));

          checkForAuth(endPoint);

        return response;
        break;

      case OCRequestType.GET:
        var response = await http.get(endPoint.asURL(baseURL), headers: headers);
        checkForAuth(endPoint);
        return response;

        break;

      case OCRequestType.PUT:
      case OCRequestType.UPLOAD:
    }


  }

  void checkForAuth(OCEndPoint endPoint) {
    if(endPoint.path == authurization.loginAPIPath) {
      //save auth from login
    }  else  if(endPoint.path == authurization.logoutAPIPath) {
      authurization.invalidateAuthToken();
    }
  }
}


void test() {
  List<dynamic> kk = List();
  kk.forEach((element) {

  });
}