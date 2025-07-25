import 'dart:io';
import 'package:get/get.dart';

import '../../../../data/services/image_api_service.dart' show ImageApiService;

class PredictionController extends GetxController {
  var imagePath = ''.obs;
  var predictionResult = ''.obs;
  var isLoading = false.obs;
  var selectedModel = 'resnet'.obs;

  final apiService = ImageApiService();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      imagePath.value = Get.arguments['file'];
      selectedModel.value = Get.arguments['model_choice'] ?? 'resnet';
      classifyImage();
    }
  }

  Future<void> classifyImage() async {
    isLoading.value = true;

    try {
      final result = await apiService.predictImage(
        imageFile: File(imagePath.value),
        modelChoice: selectedModel.value,
      );

      predictionResult.value =
          '${result['predicted_class']} (${(result['confidence'] * 100).toStringAsFixed(2)}%)';

    } catch (e) {
      predictionResult.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
