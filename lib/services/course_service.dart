import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

class CourseService {
  var apiUrl = "course";

  Future<ApiResponseModel<PagedListModel<CourseModel>>> getCourses(
          Map<String, dynamic> params) =>
      DioManager().dio.get(apiUrl, queryParameters: params).then((response) {
        return ApiResponseModel<PagedListModel<CourseModel>>.fromJson(
          response.data,
          (data) => PagedListModel<CourseModel>.fromJson(
            data,
            (value) => CourseModel.fromJson(value),
          ),
        );
      }).catchError((error) {
        print(error.toString());
        //return PagedListModel.empty<CourseModel>();
      });

  Future<ApiResponseModel<CourseModel>> getCourseById(String id) =>
      DioManager().dio.get('$apiUrl/$id').then((response) {
        return ApiResponseModel<CourseModel>.fromJson(
          response.data,
          (data) => CourseModel.fromJson(data),
        );
      }).catchError((error) {
        print(error.toString());
        // return CourseModel.empty;
      });
}
