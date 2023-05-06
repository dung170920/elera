import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'let_in_state.dart';

class LetInCubit extends Cubit<LetInState> {
  LetInCubit() : super(LetInInitial());
}
