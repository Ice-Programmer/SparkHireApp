import 'package:test/test.dart';
import 'package:sparkhite_api/sparkhite_api.dart';


/// tests for LoginControllerApi
void main() {
  final instance = SparkhiteApi().getLoginControllerApi();

  group(LoginControllerApi, () {
    //Future<BaseResponseTokenVO> userLoginByMail(UserMailLoginRequest userMailLoginRequest) async
    test('test userLoginByMail', () async {
      // TODO
    });

  });
}
