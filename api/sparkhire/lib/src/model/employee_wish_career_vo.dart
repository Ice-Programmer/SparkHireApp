//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'employee_wish_career_vo.g.dart';

/// EmployeeWishCareerVO
///
/// Properties:
/// * [id] 
/// * [userId] 
/// * [careerId] 
/// * [careerName] 
/// * [industryId] 
/// * [industryName] 
/// * [salaryExpectation] 
/// * [createTime] 
@BuiltValue()
abstract class EmployeeWishCareerVO implements Built<EmployeeWishCareerVO, EmployeeWishCareerVOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'careerId')
  int? get careerId;

  @BuiltValueField(wireName: r'careerName')
  String? get careerName;

  @BuiltValueField(wireName: r'industryId')
  int? get industryId;

  @BuiltValueField(wireName: r'industryName')
  String? get industryName;

  @BuiltValueField(wireName: r'salaryExpectation')
  String? get salaryExpectation;

  @BuiltValueField(wireName: r'createTime')
  DateTime? get createTime;

  EmployeeWishCareerVO._();

  factory EmployeeWishCareerVO([void updates(EmployeeWishCareerVOBuilder b)]) = _$EmployeeWishCareerVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EmployeeWishCareerVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EmployeeWishCareerVO> get serializer => _$EmployeeWishCareerVOSerializer();
}

class _$EmployeeWishCareerVOSerializer implements PrimitiveSerializer<EmployeeWishCareerVO> {
  @override
  final Iterable<Type> types = const [EmployeeWishCareerVO, _$EmployeeWishCareerVO];

  @override
  final String wireName = r'EmployeeWishCareerVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EmployeeWishCareerVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.careerId != null) {
      yield r'careerId';
      yield serializers.serialize(
        object.careerId,
        specifiedType: const FullType(int),
      );
    }
    if (object.careerName != null) {
      yield r'careerName';
      yield serializers.serialize(
        object.careerName,
        specifiedType: const FullType(String),
      );
    }
    if (object.industryId != null) {
      yield r'industryId';
      yield serializers.serialize(
        object.industryId,
        specifiedType: const FullType(int),
      );
    }
    if (object.industryName != null) {
      yield r'industryName';
      yield serializers.serialize(
        object.industryName,
        specifiedType: const FullType(String),
      );
    }
    if (object.salaryExpectation != null) {
      yield r'salaryExpectation';
      yield serializers.serialize(
        object.salaryExpectation,
        specifiedType: const FullType(String),
      );
    }
    if (object.createTime != null) {
      yield r'createTime';
      yield serializers.serialize(
        object.createTime,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EmployeeWishCareerVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EmployeeWishCareerVOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'careerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.careerId = valueDes;
          break;
        case r'careerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.careerName = valueDes;
          break;
        case r'industryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.industryId = valueDes;
          break;
        case r'industryName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.industryName = valueDes;
          break;
        case r'salaryExpectation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.salaryExpectation = valueDes;
          break;
        case r'createTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createTime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EmployeeWishCareerVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmployeeWishCareerVOBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

