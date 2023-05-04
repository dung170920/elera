part of 'my_course_bloc.dart';

abstract class MyCourseState extends Equatable {
  const MyCourseState();
  
  @override
  List<Object> get props => [];
}

class MyCourseInitial extends MyCourseState {}
