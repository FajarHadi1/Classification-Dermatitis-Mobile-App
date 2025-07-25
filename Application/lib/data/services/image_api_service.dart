import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ImageApiService {
  final String baseUrl = 'https://db09a9400fb6.ngrok-free.app';

  Future<Map<String, dynamic>> predictImage({
    required File imageFile,
    required String modelChoice,
  }) async {
    final uri = Uri.parse('$baseUrl/predict');

    var request = http.MultipartRequest('POST', uri);

    // Tambahkan file
    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path),
    );

    // Tambahkan model_choice
    request.fields['model_choice'] = modelChoice;

    // Kirim request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return {
        'success': true,
        'predicted_class': decoded['predicted_class'],
        'confidence': decoded['confidence'],
      };
    } else {
      throw Exception(
        'Failed with status code ${response.statusCode}: ${response.body}',
      );
    }
  }
}
