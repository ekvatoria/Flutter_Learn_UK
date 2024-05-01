// bu variable lar null gelebilir örneği
class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

// bu variable lar uygulama oluştuğunda gelecek. Constructor oluşturma
class PostModel2 {
  int userId;
  int id;
  String title;
  String body;
  PostModel2({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

// Bu variable lar sadece constructor zamanında gelebilir ve initialize olabilir.
// Diğer zamanda gelemez

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

// Named parameter almak. Yanyana variableları müşteri yazsın.
class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

//
class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  PostModel5({required int userId, required int id, required String title, required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  //üstteki tanımlar private olduğu için dışarıdan değişiklik yapılamaz ama
  // get fonksiyonu ile belli kurala bağlı olarak erişimine izin verilebilir
  int get userId => _userId;

  // {
  //       _userId = userId;
  //   _id = id;
  //   _title = title;
  //   _body = body;
  // }
}

// Bu değer sonradan gelecek. Late finalde bu değer sadece colnstructor anında sonradan gelebilir.
class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({required int userId, required int id, required String title, required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//Required vermeyi engelleyerek değer vermek.
class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({int userId = 0, int id = 0, String title = '', String body = ''}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

// biri bu classı kullanacaksa internetten datalar gelecekse
class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {
    //her zaman 2 kontrol olması önemli burada, hem null olmayacak hem de boş olmayacak.
    //ve zorunlu olmadıkça data!.length; ünlem ile force etme!!
    if (data != null && data.isNotEmpty) {
      body = data;
      data.length;
    }
  }

  //instance ın kopyasını oluşturur ve sadece vereceğiniz değişkenleri kullanabilmenizi sağlar
  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
