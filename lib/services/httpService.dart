import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import '../dto/transfer.dart';

class SingletonDio {
  static var cookieManager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookieManager);
    return dio;
  }
}

String url = 'http://10.0.2.2:8080/api/';

Future<List<HomeItemResponse>> getTasks() async {
  var response = await SingletonDio.getDio().get('${url}home');
  var lst = response.data as List;
  var lstFinal = lst.map((i) => HomeItemResponse.fromJson(i)).toList();
  return lstFinal;
}

Future<SigninResponse> signup(SignupRequest req) async {
  var response =
      await SingletonDio.getDio().post('${url}id/signup', data: req.toJson());
  return SigninResponse.fromJson(response.data);
}

Future<SigninResponse> signin(SigninRequest req) async {
  var response =
      await SingletonDio.getDio().post('${url}id/signin', data: req.toJson());
  print(response);
  return SigninResponse.fromJson(response.data);
}

Future<String> addTask(AddTaskRequest req) async {
  var response = await SingletonDio.getDio().post('${url}add',data: req.toJson());
  return response.data;
}

Future<TaskDetailResponse> getTaskDetail(int id) async{
  var response = await SingletonDio.getDio().get('${url}detail/$id');
  return TaskDetailResponse.fromJson(response.data);
}
