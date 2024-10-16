part of 'absence_bloc.dart';

sealed class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

class AbsenceGet extends AbsenceEvent {}
