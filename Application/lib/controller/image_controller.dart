// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:derma/data/services/image_api_service.dart';

// class ImageController extends GetxController {
//   final ImageApiService apiService = ImageApiService();
//   var imageFile = Rxn<File>();
//   var result = ''.obs;
//   final picker = ImagePicker();

//   Future<void> pickImage(ImageSource source) async {
//     final picked = await picker.pickImage(source: source);
//     if (picked != null) {
//       imageFile.value = File(picked.path);
//       await classify();
//     }
//   }

//   Future<void> classify() async {
//     if (imageFile.value != null) {
//       try {
//         result.value = await apiService.classifyImage(imageFile.value!.path);
//       } catch (e) {
//         result.value = 'Error: $e';
//       }
//     }
//   }
// }
