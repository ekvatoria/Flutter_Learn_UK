import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'a');
  @override
  void initState() {
    super.initState();

    final user1 = PostModel();
    user1.userId = 1;
    user1.body = 'uk';
    user1.body = 'hello';

    final user2 = PostModel2(userId: 1, id: 2, title: 'title', body: 'body');
    user2.body = 'a';

    final user3 = PostModel3(1, 1, 'title', 'body');
    //user3.body = 'a';

    //locvalde veri gösterimi için mantıklı yöntem budur.
    final user4 = PostModel4(userId: 1, id: 2, title: 'title', body: 'body');
    // user4.body = 'a';

    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body');
    //variable erişilemez safety için önemlidir

    final user7 = PostModel7();

    // serviste işlem yapıyorsan en mantıklı yöntem budur.
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          //user9 = PostModel8(title: 'On Pressed');
          user9 = user9.copyWith(title: 'uk');
          user9.updateBody(null);
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not any data'),
      ),
      body: Container(),
    );
  }
}
