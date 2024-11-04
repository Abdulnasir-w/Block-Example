import 'package:equatable/equatable.dart';

abstract class PickerEvent extends Equatable {
  const PickerEvent();
  @override
  List<Object> get props => [];
}

class ImageFromCamera extends PickerEvent {}

class ImageFromGallery extends PickerEvent {}
