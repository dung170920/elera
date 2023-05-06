import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_course_state.dart';

class MyCourseCubit extends Cubit<MyCourseState> {
  MyCourseCubit() : super(MyCourseInitial());
}
