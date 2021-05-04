import 'dart:convert';
import 'package:http/http.dart' as http;
import 'OCEndPoint.dart';
import 'OCRequestType.dart';

class OCNetwork{
  String baseURL;
  Future<http.Response> execute(OCEndPoint endPoint) async {
    switch(endPoint.requestType) {
      case OCRequestType.POST:
        var response = await http.post(endPoint.asURL(baseURL),
            headers: await endPoint.getHeaders(),
            body: endPoint.bodyParams,
            encoding: Encoding.getByName("utf-8"));

        return response;
        break;

      case OCRequestType.GET:
      case OCRequestType.PUT:
      case OCRequestType.UPLOAD:
    }
  }
}
