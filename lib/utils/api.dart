import 'package:dio/dio.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/services/services.dart';

class ApiInterceptor extends Interceptor {
  final SplashCubit cubit = SplashCubit(authService: AuthService());
  final Dio dio;

  ApiInterceptor(this.dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = "https://elera.onrender.com/api/";
    final token = cubit.state.accessToken;
    print("token $token");
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("response data ${response.data}");

    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    bool sent = false;
    if (error.response?.statusCode == 401 && !sent) {
      sent = true;
      // final user = FirebaseAuth.instance.currentUser;
      // if (user != null) {
      //   final newToken = await user.getIdToken(true);
      //   error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      //   final options = Options(
      //     method: error.requestOptions.method,
      //     headers: error.requestOptions.headers,
      //   );
      //   final response = await dio.request(
      //     error.requestOptions.path,
      //     data: error.requestOptions.data,
      //     queryParameters: error.requestOptions.queryParameters,
      //     options: options,
      //   );
      //   sent = false;
      //   return handler.resolve(response);
      // }
      sent = false;
      cubit.onAuthLogoutRequested();
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
