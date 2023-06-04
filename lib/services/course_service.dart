import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

class CourseService {
  var apiUrl = "courses";

  Future<PagedListModel<CourseModel>> getCourses(Map<String, dynamic> params) =>
      DioManager().dio.get(apiUrl, queryParameters: params).then((response) {
        var result = response.data;
        return PagedListModel<CourseModel>.fromJson(
          result,
          (data) => CourseModel.fromJson(data),
        );
      }).catchError((error) {
        print(error.toString());
        return PagedListModel.empty<CourseModel>();
      });

  Future<CourseModel> getCourseById(String id) =>
      DioManager().dio.get('$apiUrl/$id').then((response) {
        var result = response.data;
        return CourseModel.fromJson(result);
      }).catchError((error) {
        print(error.toString());
        return CourseModel.empty;
      });
}
