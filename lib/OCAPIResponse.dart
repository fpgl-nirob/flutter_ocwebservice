abstract class OCAPIResponse<M> {
  String message;
  bool success;
  M model;
  void convert(dynamic data) {
    model = convertDataToModel(data);
  }
  
  M convertDataToModel(dynamic data);
}
