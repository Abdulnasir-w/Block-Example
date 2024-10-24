import 'package:bloc_example/Switch/Bloc/switch_events.dart';
import 'package:bloc_example/Switch/Bloc/switch_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBlocs extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBlocs() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
