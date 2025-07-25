import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxService {
  static const String baseUrl =
      'https://db09a9400fb6.ngrok-free.app/predict'; // ganti dengan IP kamu
  late http.Client client;

  @override
  void onInit() {
    client = http.Client();
    super.onInit();
  }

  Future<http.Response> postImage(String endpoint, String filePath) async {
    var uri = Uri.parse('$baseUrl$endpoint');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', filePath));
    var streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
