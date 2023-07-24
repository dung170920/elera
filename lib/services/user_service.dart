import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

class UserService {
  var apiUrl = "user";

  Future<ApiResponseModel> getUserById(String id) =>
      DioManager().dio.get("$apiUrl/$id").then((response) {
        return ApiResponseModel.fromJson(
            response.data, (data) => UserModel.fromJson(data));
      }).catchError((error) {
        print(error.toString());
        return ApiResponseModel.fromJson(error, (data) => UserModel.empty);
      });

  Future<void> register() =>
      DioManager().dio.post("$apiUrl/register").then((response) {
        print("response $response");
      }).catchError((error) {
        print(error.toString());
      });
}
