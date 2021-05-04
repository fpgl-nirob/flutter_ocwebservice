library ocwebservice;
import 'dart:convert';

import 'package:ocwebservice/OCEndPoint.dart';

import 'OCNetwork.dart';
import 'OCResponse.dart';

class OCWebService<E extends OCEndPoint,R extends OCResponse> {
  OCNetwork network;
  E endPoint;
  R response;
  OCWebService({this.network,this.endPoint,this.response});

  Future<R> fetch() async {

   var apiResponse = await network.execute(endPoint);
   var data = JsonDecoder().convert(apiResponse.body);
   response = OCResponse.fromJson(data);
   response.model = response.convertDataToModel();
   return response;
  }
}



OCWebService makeOCWebService<M extends OCResponse>(OCEndPoint endPoint, M response) {
  return OCWebService<OCEndPoint, M>(network:
  OCNetwork(),
      endPoint: endPoint,
      response: response
  );
}



class Jnetwork {
  Jnetwork next;
}


void testChain() {
  Jnetwork jnetwork = Jnetwork();
  Jnetwork jnetwork1 = Jnetwork();

  jnetwork.next = jnetwork1;


}

