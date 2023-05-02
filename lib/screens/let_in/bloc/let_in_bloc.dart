import 'package:elera/screens/let_in/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LetInBloc extends Bloc<LetInEvent, LetInState> {
  LetInBloc() : super(LetInInitial()) {
    on<LetInEvent>((event, emit) {});
  }
}
