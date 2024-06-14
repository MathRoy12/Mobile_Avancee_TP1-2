import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:image_picker/image_picker.dart';
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

String url = 'http://10.0.2.2:8080/';
UsernameService usernameService = UsernameService();

Future<List<HomeItemPhotoResponse>> getTasks() async {
  var response = await SingletonDio.getDio().get('${url}api/home/photo');
  var lst = response.data as List;
  List<HomeItemPhotoResponse> lstFinal = lst.map((i) => HomeItemPhotoResponse.fromJson(i)).toList();
  return lstFinal;
}

Future<SigninResponse> signup(SignupRequest req) async {
  var response =
  await SingletonDio.getDio().post('${url}api/id/signup', data: req.toJson());
  SigninResponse res = SigninResponse.fromJson(response.data);
  usernameService.username = res.username;
  return res;
}

Future<SigninResponse> signin(SigninRequest req) async {
  var response =
  await SingletonDio.getDio().post('${url}api/id/signin', data: req.toJson());
  SigninResponse res = SigninResponse.fromJson(response.data);
  usernameService.username = res.username;
  return res;
}

Future<String> addTask(AddTaskRequest req) async {
  var response =
  await SingletonDio.getDio().post('${url}api/add', data: req.toJson());
  return response.data;
}

Future<TaskDetailPhotoResponse> getTaskDetail(int id) async {
  var response = await SingletonDio.getDio().get('${url}api/detail/photo/$id');
  return TaskDetailPhotoResponse.fromJson(response.data);
}

Future<String> saveProgress(int id, int progressValue) async {
  var response =
  await SingletonDio.getDio().get('${url}api/progress/$id/$progressValue');
  return response.data;
}

Future<String> signout() async {
  var response = await SingletonDio.getDio().get('${url}api/id/signout');
  usernameService.username = '';
  return response.data;
}

Future<String> saveImage(XFile image, int taskID) async {
  FormData formData = FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(image.path, filename: image.name),
        "taskID": taskID
      });
  var res = await SingletonDio.getDio()
      .post("${url}file", data: formData);
  return res.data;
}
