import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

var apiUrl = "user";

class UserService {
  Future<UserModel> getUserById(String id) async =>
      DioManager().dio.get("$apiUrl/$id").then((response) {
        return UserModel.fromJson(response.data);
      }).catchError((error) {
        print(error.toString());
        return UserModel.empty;
      });

  Future<void> register() async =>
      DioManager().dio.post("$apiUrl/register").then((response) {
        print("response $response");
      }).catchError((error) {
        print(error.toString());
      });
}
