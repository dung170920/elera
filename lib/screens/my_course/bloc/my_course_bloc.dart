import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

class MyCourseBloc extends Bloc<MyCourseEvent, MyCourseState> {
  MyCourseBloc() : super(MyCourseInitial()) {
    on<MyCourseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
