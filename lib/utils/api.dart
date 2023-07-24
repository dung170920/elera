import 'package:dio/dio.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';

class ApiInterceptor extends Interceptor {
  final AuthService authService = AuthService();
  final Dio dio;

  ApiInterceptor(this.dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = "https://elera.onrender.com/api/";
    authService.accessToken.listen((token) {
      print("token $token");
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    });

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    bool sent = false;
    if (error.response?.statusCode == 401 && !sent) {
      sent = true;
      String refreshToken =
          await Global.storageService.getString(Preferences.REFRESH_TOKEN);
      var result =
          await authService.getNewAccessToken({"refreshToken": refreshToken});
      if (result.result.accessToken != null) {
        error.requestOptions.headers['Authorization'] =
            'Bearer ${result.result.accessToken}';
        final options = Options(
          method: error.requestOptions.method,
          headers: error.requestOptions.headers,
        );
        final response = await dio.request(
          error.requestOptions.path,
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters,
          options: options,
        );
        return handler.resolve(response);
      }
      authService.logOut();
    }

    return super.onError(error, handler);
  }
}

class DioManager {
  static final DioManager _instance = DioManager._internal();
  final Dio dio = Dio();

  factory DioManager() {
    return _instance;
  }

  DioManager._internal() {
    dio.interceptors.add(ApiInterceptor(dio));
  }
}
