import 'package:bloc/bloc.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  final CourseService service;

  CoursesCubit(this.service) : super(CoursesState.loading());

  Future<void> fetchList() async {
    try {
      final items = await service.getCourses(state.list.toJson());
      print(items);
      emit(CoursesState.success(items));
    } on AppExceptions catch (e) {
      emit(CoursesState.failure(e.message));
    }
  }
}
