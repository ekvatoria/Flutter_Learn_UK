import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/req_res_privider.dart';
import 'package:flutter_full_learn/product/global/rescource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'reqres_test.mocks.dart';
import 'user_save_model.dart';

@GenerateMocks([ReqResProvider, ResourceContext])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'uk': "ugur"};
    SharedPreferences.setMockInitialValues(values);
    // var mockProvider = MockReqResProvider();
  });
  test('saveToLOcale - Test', () {
    var mockProvider = ReqResProvider(ReqresService(Dio()));
    final resourceContext = ResourceContext();
    final result = mockProvider.saveToLocale(resourceContext, []);

    expect(result, []);
  });

  test('userTest - Test', () async {
    // var mockProvider = UserSaveViewModel();
    var userViewModel = UserSaveViewModel();
    final result = userViewModel.getReadData("uk", MockStore());

    expect(result, false);
  });

  test('fetchItems - Test', () async {
    var mockProvider = ReqResProvider(MockReqResService());

    final result = await mockProvider.fetchItems();

    expect(result, isNotEmpty);
  });
}

class MockReqResService extends IReqresService {
  MockReqResService() : super(Dio());

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    return ResourceModel(data: [Data(color: 'a', id: 1)]);
  }
}
