import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:flutter_full_learn/product/utility/image_upload.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath = 'https://assets3.lottiefiles.com/packages/lf20_urbk83vw.json';
  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          _imageUploadViewModel.saveDataToService();
        },
      ),
      appBar: AppBar(
        title: const Text('Image Upload'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading ? const CircularProgressIndicator() : const SizedBox();
          }),
          Observer(builder: (_) {
            return Text(_imageUploadViewModel.downloadText);
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Observer(
                      builder: (context) => _imageUploadViewModel.file != null
                          ? Image.file(_imageUploadViewModel.file!)
                          : const SizedBox(),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: IconButton(
                          onPressed: () async {
                            _imageUploadViewModel.saveLocalFile(await _imageUploadManager.fetchFromLibrary());
                          },
                          icon: Lottie.network(_imageUploadLottiePath)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
              flex: 4,
              child: Observer(builder: (_) {
                return _imageUploadViewModel.imageUrl.isNotEmpty
                    ? Image.network(_imageUploadViewModel.imageUrl)
                    : const SizedBox();
              }))
        ],
      ),
    );
  }
}
