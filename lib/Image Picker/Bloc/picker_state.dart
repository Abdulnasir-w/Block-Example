import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class PickerState extends Equatable {
  final XFile? file;
  const PickerState({this.file});

  PickerState copyWith({XFile? file}) {
    return PickerState(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
