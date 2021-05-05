import 'OCRequestType.dart';

/**
 * API end point class
 * EndPoint Structure like
 *  - A path like /user, /login
 *  - Headers Map,
 *  - Body Map
 *  - Request type
 */
class OCEndPoint{
  //MARK: - Properties
  String path;
  Map<String,String> bodyParams;
  Map<String,String> headers;
  OCRequestType requestType;
  bool needAuth = true;

  OCEndPoint({this.path,
    this.bodyParams,
    this.headers,
    this.requestType,
    this.needAuth});


  // Header is method cause if need refresh token call
  Future<Map<String, String>> getHeaders() async {
    return headers;
  }

  // Make Uri using baseURL & path
  Uri asURL(String baseURLString)  {
    return Uri.parse("${baseURLString}${path}");
  }

}
