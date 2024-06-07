import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:mobile_avancee_tp1_2/dto/add_task_request.dart';
import 'package:mobile_avancee_tp1_2/dto/home_item_response.dart';
import 'package:mobile_avancee_tp1_2/dto/signup_request.dart';

import '../dto/signin_request.dart';
import '../dto/signin_response.dart';

class SingletonDio {
  static var cookieManager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookieManager);
    return dio;
  }
}

String url = 'https://lemeilleurserveur.onrender.com/api/';

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
