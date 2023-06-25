import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

class CourseTypeService {
  var apiUrl = "course-types";

  Future<List<CourseTypeModel>> getCourseTypes() =>
      DioManager().dio.get(apiUrl).then((response) {
        List result = response.data;
        return result.map((e) => CourseTypeModel.fromJson(e)).toList();
      }).catchError((error) {
        print(error.toString());
        return <CourseTypeModel>[];
      });
}
