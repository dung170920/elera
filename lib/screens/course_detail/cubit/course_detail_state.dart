part of 'course_detail_cubit.dart';

class CourseDetailState extends Equatable {
  const CourseDetailState({
    required this.status,
    this.errorMessage,
    this.course = CourseModel.empty,
  });

  factory CourseDetailState.loading() {
    return CourseDetailState(
      status: LoadStatus.loading,
    );
  }

  factory CourseDetailState.success(CourseModel course) {
    return CourseDetailState(
      status: LoadStatus.success,
      course: course,
    );
  }

  factory CourseDetailState.failure(String message) {
    return CourseDetailState(
      status: LoadStatus.failure,
      errorMessage: message,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, course];

  final LoadStatus status;
  final String? errorMessage;
  final CourseModel course;
}
