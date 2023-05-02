import 'package:equatable/equatable.dart';

abstract class LetInState extends Equatable {
  const LetInState();

  @override
  List<Object> get props => [];
}

class LetInInitial extends LetInState {}
