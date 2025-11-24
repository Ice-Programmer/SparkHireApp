import 'package:test/test.dart';
import 'package:sparkhite_api/sparkhite_api.dart';


/// tests for UserControllerApi
void main() {
  final instance = SparkhiteApi().getUserControllerApi();

  group(UserControllerApi, () {
    //Future<BaseResponseUserBasicInfo> getCurrentLoginUser() async
    test('test getCurrentLoginUser', () async {
      // TODO
    });

    //Future<BaseResponseUserBasicInfo> switchUserRole(UserSwitchRoleRequest userSwitchRoleRequest) async
    test('test switchUserRole', () async {
      // TODO
    });

  });
}
