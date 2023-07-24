import 'package:bloc/bloc.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CourseService courseService;

  HomeCubit(this.courseService) : super(HomeState.loading());

  void onPageChange(value) => emit(state.copyWith(index: value));

  Future<void> init() async {
    try {
      final response = await courseService.getCourses({'isPopular': true});
      // final types = await courseTypeService.getCourseTypes();
      emit(HomeState.success(response.result));
    } on AppExceptions catch (e) {
      emit(HomeState.failure(e.message));
    }
  }
}
