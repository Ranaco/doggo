import 'dart:io';

import 'package:doggo/app/app.locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@singleton
class ImagePickerService {
  ImagePicker imagePicker = ImagePicker();

  Future<dynamic> pickImage({bool isWall = false, ImageSource source = ImageSource.camera}) async {
    var pickedImage;
    try{
      pickedImage = await ImagePicker().pickImage(source: source);
      pickedImage != null ? _cropImage(pickedImage, isWall) : null;
    }catch(err){
      locator<SnackbarService>().showSnackbar(message: err.toString());
      rethrow;
    }
  }

  Future<dynamic> _cropImage(File? imageFile, bool isWall) async {

  }
}

