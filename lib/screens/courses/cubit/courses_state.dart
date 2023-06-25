// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'courses_cubit.dart';

class CoursesState extends Equatable {
  const CoursesState({
    required this.status,
    required this.list,
    required this.types,
    this.errorMessage,
    this.selectedType = 0,
  });

  factory CoursesState.loading() {
    return CoursesState(
      types: [],
      status: ListStatus.loading,
      list: PagedListModel.empty(),
    );
  }

  factory CoursesState.success(
      PagedListModel<CourseModel> list, List<CourseTypeModel> types) {
    return CoursesState(
      status: ListStatus.success,
      list: list,
      types: types,
    );
  }

  factory CoursesState.failure(String message) {
    return CoursesState(
      status: ListStatus.failure,
      errorMessage: message,
      list: PagedListModel.empty<CourseModel>(),
      types: [],
    );
  }

  final ListStatus status;
  final PagedListModel<CourseModel> list;
  final List<CourseTypeModel> types;
  final String? errorMessage;
  final int selectedType;

  @override
  List<Object?> get props => [status, list, errorMessage, types, selectedType];

  CoursesState copyWith({
    ListStatus? status,
    PagedListModel<CourseModel>? list,
    List<CourseTypeModel>? types,
    String? errorMessage,
    int? selectedType,
  }) {
    return CoursesState(
      status: status ?? this.status,
      list: list ?? this.list,
      types: types ?? this.types,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedType: selectedType ?? this.selectedType,
    );
  }
}
