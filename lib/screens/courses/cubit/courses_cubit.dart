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
      : super(CoursesState.init());

  Future<void> init() async {
    try {
      emit(CoursesState.init());
      final response = await courseService.getCourses(state.list.toJson());
      final types = await courseTypeService.getCourseTypes();
      emit(CoursesState.success(response.result, types.result));
    } on AppExceptions catch (e) {
      emit(CoursesState.failure(e.message));
    }
  }

  Future<void> changeSelectedType(int type) async {
    try {
      emit(state.copyWith(status: LoadStatus.loading));

      if (type != 0) {
        final response = await courseService.getCourses(
            {...state.list.toJson(), 'courseTypeId': state.types[type - 1].id});
        emit(CoursesState.success(response.result, state.types));
      } else {
        final response = await courseService.getCourses(state.list.toJson());
        emit(CoursesState.success(response.result, state.types));
      }
      emit(state.copyWith(selectedType: type));
    } catch (e) {
      emit(CoursesState.failure(e.toString()));
    }
  }
}
