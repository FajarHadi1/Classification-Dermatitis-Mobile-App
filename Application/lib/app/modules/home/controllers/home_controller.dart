import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var imagePath = ''.obs;

  // Tambahan: model yang dipilih
  var selectedModel = 'resnet'.obs; // default

  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path;
      Get.toNamed(
        Routes.PREDICTION,
        arguments: {"file": image.path, "model_choice": selectedModel.value},
      );
      Get.snackbar('Berhasil', 'Foto dari kamera dipilih');
    }
  }

  Future<void> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path;
        Get.toNamed(
          Routes.PREDICTION,
          arguments: {"file": image.path, "model_choice": selectedModel.value},
        );
        Get.snackbar('Berhasil', 'Foto dari galeri dipilih');
      } else {
        Get.snackbar('Info', 'Tidak ada gambar yang dipilih');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal memilih gambar: $e');
    }
  }

  void showPicker(BuildContext context) {
    Get.bottomSheet(
      SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Kamera'),
              onTap: () {
                pickFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galeri'),
              onTap: () {
                pickFromGallery();
                Get.back();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
