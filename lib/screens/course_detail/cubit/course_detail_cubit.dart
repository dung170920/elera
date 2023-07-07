import 'package:bloc/bloc.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'course_detail_state.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseService courseService = CourseService();

  CourseDetailCubit() : super(CourseDetailState.loading());

  Future<void> getCourse(String id) async {
    try {
      var course = await courseService.getCourseById(id);
      print(course);
      emit(CourseDetailState.success(course));
    } on AppExceptions catch (e) {
      emit(CourseDetailState.failure(e.message));
    }
  }
}
