//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:sparkhire_api/src/model/school_vo.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'base_response_list_school_vo.g.dart';

/// BaseResponseListSchoolVO
///
/// Properties:
/// * [code] 
/// * [data] 
/// * [message] 
@BuiltValue()
abstract class BaseResponseListSchoolVO implements Built<BaseResponseListSchoolVO, BaseResponseListSchoolVOBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'data')
  BuiltList<SchoolVO>? get data;

  @BuiltValueField(wireName: r'message')
  String? get message;

  BaseResponseListSchoolVO._();

  factory BaseResponseListSchoolVO([void updates(BaseResponseListSchoolVOBuilder b)]) = _$BaseResponseListSchoolVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BaseResponseListSchoolVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseResponseListSchoolVO> get serializer => _$BaseResponseListSchoolVOSerializer();
}

class _$BaseResponseListSchoolVOSerializer implements PrimitiveSerializer<BaseResponseListSchoolVO> {
  @override
  final Iterable<Type> types = const [BaseResponseListSchoolVO, _$BaseResponseListSchoolVO];

  @override
  final String wireName = r'BaseResponseListSchoolVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BaseResponseListSchoolVO object, {
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
        specifiedType: const FullType(BuiltList, [FullType(SchoolVO)]),
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
    BaseResponseListSchoolVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BaseResponseListSchoolVOBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(SchoolVO)]),
          ) as BuiltList<SchoolVO>;
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
  BaseResponseListSchoolVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseResponseListSchoolVOBuilder();
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

