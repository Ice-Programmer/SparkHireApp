import 'package:test/test.dart';
import 'package:sparkhite_api/sparkhite_api.dart';


/// tests for EmployeeControllerApi
void main() {
  final instance = SparkhiteApi().getEmployeeControllerApi();

  group(EmployeeControllerApi, () {
    //Future<BaseResponseLong> addEmployee(EmployeeAddRequest employeeAddRequest) async
    test('test addEmployee', () async {
      // TODO
    });

    //Future<BaseResponseBoolean> editEmployee(EmployeeEditRequest employeeEditRequest) async
    test('test editEmployee', () async {
      // TODO
    });

    //Future<BaseResponseEmployeeVO> getMyEmployeeVO() async
    test('test getMyEmployeeVO', () async {
      // TODO
    });

  });
}
