//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:sparkhire_api/src/model/education_experience_vo.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'base_response_list_education_experience_vo.g.dart';

/// BaseResponseListEducationExperienceVO
///
/// Properties:
/// * [code] 
/// * [data] 
/// * [message] 
@BuiltValue()
abstract class BaseResponseListEducationExperienceVO implements Built<BaseResponseListEducationExperienceVO, BaseResponseListEducationExperienceVOBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'data')
  BuiltList<EducationExperienceVO>? get data;

  @BuiltValueField(wireName: r'message')
  String? get message;

  BaseResponseListEducationExperienceVO._();

  factory BaseResponseListEducationExperienceVO([void updates(BaseResponseListEducationExperienceVOBuilder b)]) = _$BaseResponseListEducationExperienceVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BaseResponseListEducationExperienceVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseResponseListEducationExperienceVO> get serializer => _$BaseResponseListEducationExperienceVOSerializer();
}

class _$BaseResponseListEducationExperienceVOSerializer implements PrimitiveSerializer<BaseResponseListEducationExperienceVO> {
  @override
  final Iterable<Type> types = const [BaseResponseListEducationExperienceVO, _$BaseResponseListEducationExperienceVO];

  @override
  final String wireName = r'BaseResponseListEducationExperienceVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BaseResponseListEducationExperienceVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(EducationExperienceVO)]),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BaseResponseListEducationExperienceVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BaseResponseListEducationExperienceVOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(EducationExperienceVO)]),
          ) as BuiltList<EducationExperienceVO>;
          result.data.replace(valueDes);
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BaseResponseListEducationExperienceVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseResponseListEducationExperienceVOBuilder();
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

