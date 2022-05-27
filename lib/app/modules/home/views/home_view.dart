
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
      
      ),
      body: Center(
        child: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Obx(()=>controller.selectedImagePath.value==''? 
          Text('Select an Image From Camera or Gallery', style: TextStyle(fontSize: 20)) 
          : Image.file(File(controller.selectedImagePath.value))),

          Obx(()=>Text(controller.selectedImageSize.value==""? '' 
          :controller.selectedImageSize.value)),
          ElevatedButton(onPressed: (){
             controller.getImage(ImageSource.camera);
          }, child: Text('Camera')),
          ElevatedButton(onPressed: (){

            controller.getImage(ImageSource.gallery);
          }, child: Text('Gallery')),

          ],
        ),),
      )
    );
  }
}
