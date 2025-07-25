import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/prediction_controller.dart';

class PredictionView extends GetView<PredictionController> {
  const PredictionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Prediksi')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (controller.imagePath.value.isNotEmpty)
                Image.file(File(controller.imagePath.value), height: 300),
              const SizedBox(height: 24),
              Text(
                'Hasil Prediksi:',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                controller.predictionResult.value,
                style: const TextStyle(fontSize: 18, color: Colors.teal),
              ),
            ],
          ),
        );
      }),
    );
  }
}
