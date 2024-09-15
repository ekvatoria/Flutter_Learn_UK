import 'package:vexana/vexana.dart';

class VexanaNetworkManager extends NetworkManager<EmptyModel> {
  VexanaNetworkManager() : super(options: BaseOptions(baseUrl: 'https://reqres.in/'));
}
