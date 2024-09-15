import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/product/service/vexana_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILoginService loginService;
  setUp(() {
    // loginService = LoginService(NetworkManager<EmptyModel>(options: BaseOptions(baseUrl: 'https://reqres.in/')));
    loginService = LoginService(VexanaNetworkManager());
  });
  test('Login Test - eve.holt@reqres.in & pistol', () async {
    final response = await loginService.login(const LoginModel('eve.holt@reqres.in', 'pistol'));

    expect(response?.data, isNotNull);
  });
}
