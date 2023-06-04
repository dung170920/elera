part of 'courses_cubit.dart';

class CoursesState extends Equatable {
  const CoursesState._({
    this.status = ListStatus.loading,
    required this.list,
    this.errorMessage,
  });

  CoursesState.loading() : this._(list: PagedListModel.empty<CourseModel>());

  const CoursesState.success(PagedListModel<CourseModel> list)
      : this._(status: ListStatus.success, list: list);

  CoursesState.failure(String message)
      : this._(
          status: ListStatus.failure,
          errorMessage: message,
          list: PagedListModel.empty<CourseModel>(),
        );

  final ListStatus status;
  final PagedListModel<CourseModel> list;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, list, errorMessage];
}
