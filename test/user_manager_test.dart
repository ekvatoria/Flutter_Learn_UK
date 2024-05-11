import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      GenericUser('uk', '11', 10),
      GenericUser('uk', '11', 10),
      GenericUser('uk', '11', 20),
    ];

    final userManagement = UserManagement(AdminUser('uadmin', '1', 15, 1));
    final result = userManagement.calculateMoney(users);
    final response = userManagement.showNames(users);

    expect(result, 55);
  });
}
