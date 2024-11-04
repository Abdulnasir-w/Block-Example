import 'package:bloc/bloc.dart';
import 'package:bloc_example/Image%20Picker/Bloc/picker_event.dart';
import 'package:bloc_example/Image%20Picker/Bloc/picker_state.dart';
import 'package:bloc_example/Image%20Picker/Utils/picker_code.dart';
import 'package:image_picker/image_picker.dart';

class PickerBloc extends Bloc<PickerEvent, PickerState> {
  final Picker picker;
  PickerBloc(this.picker) : super(const PickerState()) {
    on<ImageFromCamera>(imageFromCamera);
    on<ImageFromGallery>(imageFromGallery);
  }

  void imageFromCamera(ImageFromCamera event, Emitter<PickerState> emit) async {
    XFile? file = await picker.pickFromCamera();
    emit(state.copyWith(file: file));
  }

  void imageFromGallery(
      ImageFromGallery event, Emitter<PickerState> emit) async {
    XFile? file = await picker.pickFromGallery();
    emit(state.copyWith(file: file));
  }
}
