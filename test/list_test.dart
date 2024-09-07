import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List best of', () {
    final users = [
      const GenericUser('uk1', '11', 5),
      const GenericUser('uk2', '11', 10),
      const GenericUser('uk3', '11', 20),
    ];
    // Buradaki listede elimizdeki modelden yeni liste oluşturuyoruz.
    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    //Users içinde name alanı uk olan kayıtları listelemek
    try {
      final response = users.singleWhere(
        (element) => element.findUserName('x'),
        orElse: () {
          return const GenericUser('name', 'id', 15);
        },
      );
      print(response.name);
    } catch (e) {
      print(e);
    }

    // Dar.developer dan gelen import ile log eklenerek tırnak içinde $ ile aranır.
    // log('${users.where((element) => element.money > 5)}');
    // GenericUser içinde money'e to string eklenerek sonuç getirilebildi.
    print('${users.where((element) => element.money > 500)}');

    //listenin sonuna ekleme
    users.addAll([const GenericUser('name', 'id', 5)]);
    users.lastWhere((element) => element.id == '5');

    users.take(5);
    users.remove(const GenericUser('uk1', '11', 5));
    users.removeAt(2);
    users.removeWhere((element) => element.id == 11);
    users.indexOf(const GenericUser('uk1', '11', 5));
    final result = users.indexWhere((element) => element.id == '11');
    if (result >= 0) {
      users[result] = const GenericUser('a', 'b', 15);
    }

    users.expand((element) => [const GenericUser('a', '1', 15)]);
    // users.map((e) => e.money).where((element) => element > 5);
  });

  test('List best of with collection', () {
    final users = [
      const GenericUser('uk1', '11', 5),
      const GenericUser('uk2', '11', 10),
      const GenericUser('uk3', '11', 20),
    ];

    //Collection paketi ile users içinde name alanı uk olan kayıtları listelemek
    // Kayıt yoksa singleWhereOrNull ile null getirmek

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('x'),
    );

    users.lastWhereOrNull((element) => element.id == '5');

    users.lastOrNull;
    users.forEachIndexed((index, element) {});
    users.sample(3);
    print(users.first == const GenericUser('uk1', '11', 5));
    print(users.contains(const GenericUser('uk1', '11', 5)));

    users.any((element) => element.money > 5);

    print(response);
  });
}
