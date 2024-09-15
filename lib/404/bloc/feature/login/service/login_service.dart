import '../model/login_model.dart';
import '../../../../../product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);
  Future<IResponseModel<TokenModel?, dynamic>?> login(LoginModel model);

  final String _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?, dynamic>?> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        data: model, parseModel: const TokenModel('token'), method: RequestType.POST);
  }
}
