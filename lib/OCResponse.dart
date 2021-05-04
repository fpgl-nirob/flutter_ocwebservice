class OCResponse<M> {
  String message;
  bool success;
  dynamic data;
  M model;

  OCResponse({this.message,this.success,this.data});

  factory OCResponse.fromJson(Map<dynamic,dynamic> dic) {
    return OCResponse(message: dic['message'], success: dic['success'], data: dic['data']);
  }

  M convertDataToModel(){}
}
