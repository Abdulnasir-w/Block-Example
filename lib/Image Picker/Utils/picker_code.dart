import 'package:image_picker/image_picker.dart';

class Picker {
  final ImagePicker picker = ImagePicker();

  // Gallery
  Future<XFile?> pickFromGallery() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return file;
    }
    return null;
  }

  // Camera
  Future<XFile?> pickFromCamera() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      return file;
    }
    return null;
  }
}
