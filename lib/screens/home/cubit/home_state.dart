part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int index;
  final LoadStatus status;
  final String? errorMessage;
  final PagedListModel<CourseModel> courses;

  const HomeState(
      {this.index = 0,
      required this.status,
      this.errorMessage,
      required this.courses});

  @override
  List<Object?> get props => [index, status, errorMessage, courses];

  HomeState copyWith({
    int? index,
    LoadStatus? status,
    String? errorMessage,
    PagedListModel<CourseModel>? courses,
  }) {
    return HomeState(
      index: index ?? this.index,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      courses: courses ?? this.courses,
    );
  }

  factory HomeState.init() {
    return HomeState(
      courses: PagedListModel.empty(),
      status: LoadStatus.loading,
    );
  }

  factory HomeState.success(
    PagedListModel<CourseModel> courses,
  ) {
    return HomeState(
      courses: courses,
      status: LoadStatus.success,
    );
  }

  factory HomeState.failure(String message) {
    return HomeState(
      status: LoadStatus.failure,
      errorMessage: message,
      courses: PagedListModel.empty<CourseModel>(),
    );
  }
}
