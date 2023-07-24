import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

class CourseTypeService {
  var apiUrl = "course-type";

  Future<ApiResponseModel<List<CourseTypeModel>>> getCourseTypes() =>
      DioManager().dio.get(apiUrl).then((response) {
        return ApiResponseModel<List<CourseTypeModel>>.fromJson(
          response.data,
          (data) => data
              .map<CourseTypeModel>((e) => CourseTypeModel.fromJson(e))
              .toList(),
        );
      }).catchError((error) {
        print(error.toString());
        // return <CourseTypeModel>[];
      });
}
