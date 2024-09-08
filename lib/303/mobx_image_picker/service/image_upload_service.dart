import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/model/image_upload_response.dart';

class ImageUploadService {
  //https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  final Dio dio;

  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadToImageServer(Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    // final formData = FormData.fromMap({
    //   '': MultipartFile.fromBytes(byteArray),
    // });

    final response = await dio.post('full%2F$name.png', data: byteArray, onSendProgress: onSendProgress);
    if (response.statusCode == HttpStatus.ok) {
      // final responseData = Null Check
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
