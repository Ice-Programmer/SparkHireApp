//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'education_exp_edit_request.g.dart';

/// EducationExpEditRequest
///
/// Properties:
/// * [id] 
/// * [schoolId] 
/// * [educationType] 
/// * [beginYear] 
/// * [endYear] 
/// * [majorId] 
/// * [activity] 
@BuiltValue()
abstract class EducationExpEditRequest implements Built<EducationExpEditRequest, EducationExpEditRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'schoolId')
  int? get schoolId;

  @BuiltValueField(wireName: r'educationType')
  int? get educationType;

  @BuiltValueField(wireName: r'beginYear')
  int? get beginYear;

  @BuiltValueField(wireName: r'endYear')
  int? get endYear;

  @BuiltValueField(wireName: r'majorId')
  int? get majorId;

  @BuiltValueField(wireName: r'activity')
  String? get activity;

  EducationExpEditRequest._();

  factory EducationExpEditRequest([void updates(EducationExpEditRequestBuilder b)]) = _$EducationExpEditRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EducationExpEditRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EducationExpEditRequest> get serializer => _$EducationExpEditRequestSerializer();
}

class _$EducationExpEditRequestSerializer implements PrimitiveSerializer<EducationExpEditRequest> {
  @override
  final Iterable<Type> types = const [EducationExpEditRequest, _$EducationExpEditRequest];

  @override
  final String wireName = r'EducationExpEditRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EducationExpEditRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.schoolId != null) {
      yield r'schoolId';
      yield serializers.serialize(
        object.schoolId,
        specifiedType: const FullType(int),
      );
    }
    if (object.educationType != null) {
      yield r'educationType';
      yield serializers.serialize(
        object.educationType,
        specifiedType: const FullType(int),
      );
    }
    if (object.beginYear != null) {
      yield r'beginYear';
      yield serializers.serialize(
        object.beginYear,
        specifiedType: const FullType(int),
      );
    }
    if (object.endYear != null) {
      yield r'endYear';
      yield serializers.serialize(
        object.endYear,
        specifiedType: const FullType(int),
      );
    }
    if (object.majorId != null) {
      yield r'majorId';
      yield serializers.serialize(
        object.majorId,
        specifiedType: const FullType(int),
      );
    }
    if (object.activity != null) {
      yield r'activity';
      yield serializers.serialize(
        object.activity,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EducationExpEditRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EducationExpEditRequestBuilder result,
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
        case r'schoolId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.schoolId = valueDes;
          break;
        case r'educationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.educationType = valueDes;
          break;
        case r'beginYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.beginYear = valueDes;
          break;
        case r'endYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.endYear = valueDes;
          break;
        case r'majorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.majorId = valueDes;
          break;
        case r'activity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.activity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EducationExpEditRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EducationExpEditRequestBuilder();
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

