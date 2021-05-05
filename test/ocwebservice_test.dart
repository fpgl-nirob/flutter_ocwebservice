import 'package:flutter_test/flutter_test.dart';
import 'package:ocwebservice/OCEndPoint.dart';
import 'package:ocwebservice/OCAPIResponse.dart';

import 'package:ocwebservice/ocwebservice.dart';



class CaledarDataModel {
  String emoji;
  String startDate;
  String endDate;

  CaledarDataModel();

  factory CaledarDataModel.formJSON(Map<dynamic,dynamic> dic) {
    return CaledarDataModel();
  }

}


