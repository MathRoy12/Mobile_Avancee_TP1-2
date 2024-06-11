import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:mobile_avancee_tp1_2/services/username_service.dart';
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
UsernameService usernameService = UsernameService();

Future<List<HomeItemResponse>> getTasks() async {
  var response = await SingletonDio.getDio().get('${url}home');
  var lst = response.data as List;
  var lstFinal = lst.map((i) => HomeItemResponse.fromJson(i)).toList();
  return lstFinal;
}

Future<SigninResponse> signup(SignupRequest req) async {
  var response =
      await SingletonDio.getDio().post('${url}id/signup', data: req.toJson());
  SigninResponse res = SigninResponse.fromJson(response.data);
  usernameService.username = res.username;
  return res;
}

Future<SigninResponse> signin(SigninRequest req) async {
  var response =
      await SingletonDio.getDio().post('${url}id/signin', data: req.toJson());
  SigninResponse res = SigninResponse.fromJson(response.data);
  usernameService.username = res.username;
  return res;
}

Future<String> addTask(AddTaskRequest req) async {
  var response =
      await SingletonDio.getDio().post('${url}add', data: req.toJson());
  return response.data;
}

Future<TaskDetailResponse> getTaskDetail(int id) async {
  var response = await SingletonDio.getDio().get('${url}detail/$id');
  return TaskDetailResponse.fromJson(response.data);
}

Future<String> saveProgress(int id, int progressValue) async {
  var response =
      await SingletonDio.getDio().get('${url}progress/$id/$progressValue');
  return response.data;
}

Future<String> signout() async {
  var response = await SingletonDio.getDio().get('${url}id/signout');
  usernameService.username = '';
  return response.data;
}
