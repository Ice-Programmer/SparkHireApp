import 'package:test/test.dart';
import 'package:sparkhite_api/sparkhite_api.dart';


/// tests for BizControllerApi
void main() {
  final instance = SparkhiteApi().getBizControllerApi();

  group(BizControllerApi, () {
    //Future<BaseResponseString> sendVerifyCode(VerifyCodeRequest verifyCodeRequest) async
    test('test sendVerifyCode', () async {
      // TODO
    });

  });
}
