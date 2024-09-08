import 'dart:convert';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    //JsonEncode ve JsonDecode pahallı işlemlerdir. Compute ile daha verimli kullanılabilir.
    // ignore: no_leading_underscores_for_local_identifiers
    final _items = items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    //JsonEncode ve JsonDecode pahallı işlemlerdir. Compute ile daha verimli kullanılabilir.
    // ignore: no_leading_underscores_for_local_identifiers
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }

        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
