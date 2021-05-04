import 'package:flutter_test/flutter_test.dart';
import 'package:ocwebservice/OCEndPoint.dart';
import 'package:ocwebservice/OCResponse.dart';

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

/// {mess,suu,data}

class CalendarEndPoint extends OCEndPoint {

}



class CalendarAPIResponse extends OCResponse<List<CaledarDataModel>> {


  @override
  List<CaledarDataModel> convertDataToModel() {
    ///
    ///

    return List<CaledarDataModel>();
  }
}





void main()  async{

  var endPoint = CalendarEndPoint();

  endPoint.path = "/calender";


  OCWebService<CalendarEndPoint,CalendarAPIResponse> calenderAPIServive = makeOCWebService<CalendarAPIResponse>(CalendarEndPoint(), CalendarAPIResponse());

  var calenderResponse = await calenderAPIServive.fetch();

  calenderResponse.model.forEach((element) {

  });

}


class UserModel {
  String name;
  String imgPath;
  String email;
  int id;

  UserModel();

  factory UserModel.fromJson(Map<dynamic,dynamic> dic) {
    return UserModel();
  }
}

class LoginResponse extends OCResponse<List<UserModel>> {
  @override
  List<UserModel> convertDataToModel() {
    return List<UserModel>();//UserModel.fromJson(data);
  }
}

