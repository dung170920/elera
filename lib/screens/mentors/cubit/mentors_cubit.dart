import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mentors_state.dart';

class MentorsCubit extends Cubit<MentorsState> {
  MentorsCubit() : super(MentorsInitial());
}
