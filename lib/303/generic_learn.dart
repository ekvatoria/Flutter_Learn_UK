class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney =
        users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
    // ignore: no_leading_underscores_for_local_identifiers
    final _monney = users.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);
    return _monney;
  }

  Iterable<UKModels<R>>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      //bunu sadece role 1 olanlar
      final names = users.map((e) => UKModels<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class UKModels<T> {
  final String name = 'uk';
  final List<T> items;

  UKModels(this.items);
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
