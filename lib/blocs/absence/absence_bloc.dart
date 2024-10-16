import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/absence_model.dart';
import 'package:kampus/services/absence_service.dart';

part 'absence_event.dart';
part 'absence_state.dart';

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc() : super(AbsenceInitial()) {
    on<AbsenceEvent>((event, emit) async {
      if (event is AbsenceGet) {
        try {
          emit(AbsenceLoading());

          final krs = await AbsenceService().getAbsence();
          emit(AbsenceSuccess(krs));
        } catch (e) {
          emit(AbsenceFailed(e.toString()));
        }
      }
    });
  }
}
