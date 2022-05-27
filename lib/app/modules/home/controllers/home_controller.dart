import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
 var selectedImagePath = "".obs;
 var selectedImageSize = "".obs;

void getImage(ImageSource imageSource)async{
  final pickedFile = await ImagePicker().getImage(source: imageSource);
  if (pickedFile!=null) {
    selectedImagePath.value= pickedFile.path;
    selectedImageSize.value=((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2) +"MB";

    
  } else {
    Get.snackbar('Error', 'Image Not Selected');
  }
}

}