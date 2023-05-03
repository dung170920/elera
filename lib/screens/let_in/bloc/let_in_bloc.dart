import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'let_in_event.dart';
part 'let_in_state.dart';

class LetInBloc extends Bloc<LetInEvent, LetInState> {
  LetInBloc() : super(LetInInitial()) {
    on<LetInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
