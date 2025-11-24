//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'employee_edit_request.g.dart';

/// EmployeeEditRequest
///
/// Properties:
/// * [id] 
/// * [age] 
/// * [profile] 
/// * [skillTags] 
/// * [qualifications] 
/// * [education] 
/// * [graduationYear] 
/// * [jobStatus] 
/// * [cityId] 
/// * [latitude] 
/// * [longitude] 
@BuiltValue()
abstract class EmployeeEditRequest implements Built<EmployeeEditRequest, EmployeeEditRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'age')
  int? get age;

  @BuiltValueField(wireName: r'profile')
  String? get profile;

  @BuiltValueField(wireName: r'skillTags')
  BuiltList<String>? get skillTags;

  @BuiltValueField(wireName: r'qualifications')
  BuiltList<int>? get qualifications;

  @BuiltValueField(wireName: r'education')
  int? get education;

  @BuiltValueField(wireName: r'graduationYear')
  int? get graduationYear;

  @BuiltValueField(wireName: r'jobStatus')
  int? get jobStatus;

  @BuiltValueField(wireName: r'cityId')
  int? get cityId;

  @BuiltValueField(wireName: r'latitude')
  num? get latitude;

  @BuiltValueField(wireName: r'longitude')
  num? get longitude;

  EmployeeEditRequest._();

  factory EmployeeEditRequest([void updates(EmployeeEditRequestBuilder b)]) = _$EmployeeEditRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EmployeeEditRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EmployeeEditRequest> get serializer => _$EmployeeEditRequestSerializer();
}

class _$EmployeeEditRequestSerializer implements PrimitiveSerializer<EmployeeEditRequest> {
  @override
  final Iterable<Type> types = const [EmployeeEditRequest, _$EmployeeEditRequest];

  @override
  final String wireName = r'EmployeeEditRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EmployeeEditRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.age != null) {
      yield r'age';
      yield serializers.serialize(
        object.age,
        specifiedType: const FullType(int),
      );
    }
    if (object.profile != null) {
      yield r'profile';
      yield serializers.serialize(
        object.profile,
        specifiedType: const FullType(String),
      );
    }
    if (object.skillTags != null) {
      yield r'skillTags';
      yield serializers.serialize(
        object.skillTags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.qualifications != null) {
      yield r'qualifications';
      yield serializers.serialize(
        object.qualifications,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
    if (object.education != null) {
      yield r'education';
      yield serializers.serialize(
        object.education,
        specifiedType: const FullType(int),
      );
    }
    if (object.graduationYear != null) {
      yield r'graduationYear';
      yield serializers.serialize(
        object.graduationYear,
        specifiedType: const FullType(int),
      );
    }
    if (object.jobStatus != null) {
      yield r'jobStatus';
      yield serializers.serialize(
        object.jobStatus,
        specifiedType: const FullType(int),
      );
    }
    if (object.cityId != null) {
      yield r'cityId';
      yield serializers.serialize(
        object.cityId,
        specifiedType: const FullType(int),
      );
    }
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(num),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EmployeeEditRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EmployeeEditRequestBuilder result,
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
        case r'age':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.age = valueDes;
          break;
        case r'profile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.profile = valueDes;
          break;
        case r'skillTags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.skillTags.replace(valueDes);
          break;
        case r'qualifications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.qualifications.replace(valueDes);
          break;
        case r'education':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.education = valueDes;
          break;
        case r'graduationYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.graduationYear = valueDes;
          break;
        case r'jobStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.jobStatus = valueDes;
          break;
        case r'cityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cityId = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.longitude = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EmployeeEditRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmployeeEditRequestBuilder();
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

