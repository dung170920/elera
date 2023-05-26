import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

var apiUrl = "user";

Future<UserModel> getUserById(String id) async =>
    DioManager().dio.get("$apiUrl/$id").then((response) {
      print("id");
      print(response);
      return UserModel(id: id);
    }).catchError((error) {
      print(error.toString());
      return UserModel.empty;
    });
