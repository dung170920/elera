import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

class UserService {
  var apiUrl = "user";

  Future<UserModel> getUserById(String id) =>
      DioManager().dio.get("$apiUrl/$id").then((response) {
        return UserModel.fromJson(response.data);
      }).catchError((error) {
        print(error.toString());
        return UserModel.empty;
      });

  Future<void> register() =>
      DioManager().dio.post("$apiUrl/register").then((response) {
        print("response $response");
      }).catchError((error) {
        print(error.toString());
      });
}
