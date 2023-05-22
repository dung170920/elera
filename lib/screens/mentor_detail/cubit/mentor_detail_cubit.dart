import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mentor_detail_state.dart';

class MentorDetailCubit extends Cubit<MentorDetailState> {
  MentorDetailCubit() : super(MentorDetailInitial());
}
