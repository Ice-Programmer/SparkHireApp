//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:sparkhire_api/src/model/major_vo.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'base_response_list_major_vo.g.dart';

/// BaseResponseListMajorVO
///
/// Properties:
/// * [code] 
/// * [data] 
/// * [message] 
@BuiltValue()
abstract class BaseResponseListMajorVO implements Built<BaseResponseListMajorVO, BaseResponseListMajorVOBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'data')
  BuiltList<MajorVO>? get data;

  @BuiltValueField(wireName: r'message')
  String? get message;

  BaseResponseListMajorVO._();

  factory BaseResponseListMajorVO([void updates(BaseResponseListMajorVOBuilder b)]) = _$BaseResponseListMajorVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BaseResponseListMajorVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseResponseListMajorVO> get serializer => _$BaseResponseListMajorVOSerializer();
}

class _$BaseResponseListMajorVOSerializer implements PrimitiveSerializer<BaseResponseListMajorVO> {
  @override
  final Iterable<Type> types = const [BaseResponseListMajorVO, _$BaseResponseListMajorVO];

  @override
  final String wireName = r'BaseResponseListMajorVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BaseResponseListMajorVO object, {
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
        specifiedType: const FullType(BuiltList, [FullType(MajorVO)]),
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
    BaseResponseListMajorVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BaseResponseListMajorVOBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(MajorVO)]),
          ) as BuiltList<MajorVO>;
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
  BaseResponseListMajorVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseResponseListMajorVOBuilder();
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

