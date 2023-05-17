import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit() : super(MyCoursesState());
}
