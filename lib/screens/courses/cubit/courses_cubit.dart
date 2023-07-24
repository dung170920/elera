import 'package:bloc/bloc.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  final CourseService courseService;
  final CourseTypeService courseTypeService;

  CoursesCubit(this.courseService, this.courseTypeService)
      : super(CoursesState.loading());

  Future<void> init() async {
    try {
      final response = await courseService.getCourses(state.list.toJson());
      final types = await courseTypeService.getCourseTypes();
      emit(CoursesState.success(response.result, types));
    } on AppExceptions catch (e) {
      emit(CoursesState.failure(e.message));
    }
  }

  void changeSelectedType(int type) {
    emit(state.copyWith(selectedType: type));
  }
}
