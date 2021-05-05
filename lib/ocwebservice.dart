library ocwebservice;
import 'dart:convert';

import 'package:ocwebservice/OCEndPoint.dart';

import 'OCNetwork.dart';
import 'OCAPIResponse.dart';

class OCWebService<E extends OCEndPoint,R extends OCAPIResponse> {
  OCNetwork network;
  E endPoint;
  R response;
  OCWebService({this.network,this.endPoint,this.response});

  Future<R> fetch() async {
   var apiResponse = await network.execute(endPoint);
   var data = JsonDecoder().convert(apiResponse.body);
   response.convert(data);
   return response;
  }
}



OCWebService makeOCWebService<M extends OCAPIResponse>(OCEndPoint endPoint, M response) {
  return OCWebService<OCEndPoint, M>(network:
  OCNetwork(""),
      endPoint: endPoint,
    response: response
  );
}

