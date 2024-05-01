import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comments_learn_view.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  //1-Servisten datalar array geleceği düşünülerek ilk olarak liste oluşturuluyor.
  //2-Listenin gösterimi lwb ile ekrana basılıyor.
  List<PostModel>? _items;
  String? name;
  //6.1-Servisten yanıt gelene kadar boolean tanımlama yapılır
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'http://jsonplaceholder.typicode.com/';

  //TEST EDILEBILIR KOD BAŞLADI
  late final IPostService _postService;

  //4-Proje ilk başladığında çağıracağımız yer initstate olduğundan eklemesini yapıyoruz.
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = 'uğur';
    fetchPostItems();
  }

  //6.2-_changeLoading isimli bir fonksiyon oluşturulup setstate zamanında  loading = !loading olarak belirtilir.
  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  //3-Dio paketinde kullandığımız get requestleri için fonksiyon yazıyoruz.
  Future<void> fetchPostItems() async {
    //6.3-Fonsksiyon datalar gelmeden önce çağırılır. Future fetch post ta
    _changeLoading();
    //Future demek bu kodu bekle ve bu koddan sonra alt satıra geçme demek.
    final response = await Dio().get('http://jsonplaceholder.typicode.com/posts');

    //5-Kesinlikle yapılması gereken if koşulu ile ve == ile response durumuna bakılmalıdır.
    if (response.statusCode == HttpStatus.ok) {
      // ignore: no_leading_underscores_for_local_identifiers
      final _datas = response.data;
      if (_datas is List) {
        // maplemek mevcut listeyi yeni liste yapılmak için kullanılır ve setstate anında yapılmalıdır.
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    //6.4-Dataların bittiği noktada olan koddan sonra fonksiyon tekrar çağırılır.
    _changeLoading();
  }

  // --**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**//
  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const Center(child: CircularProgressIndicator.adaptive()) : const SizedBox.shrink()],
        title: Text(name ?? ''),
      ),
      body: _items == null
          ? ErrorWidget('Sunucudan veriler çekilemedi. Lütfen sistem yöneticiniz ile iletişime geçiniz.')
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentsLearnView(postId: _model?.id)));
        },
        //7-Verileri ekranda göstermek için _items olarak adlandırdığımız veri kümesinin title alanını
        //modelde null işaretlendiği için nullable olarak ve data gelmezse '' olarak işaretliyoruz.
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
