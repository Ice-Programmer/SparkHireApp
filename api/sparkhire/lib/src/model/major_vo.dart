//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'major_vo.g.dart';

/// MajorVO
///
/// Properties:
/// * [id] 
/// * [majorName] 
@BuiltValue()
abstract class MajorVO implements Built<MajorVO, MajorVOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'majorName')
  String? get majorName;

  MajorVO._();

  factory MajorVO([void updates(MajorVOBuilder b)]) = _$MajorVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MajorVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MajorVO> get serializer => _$MajorVOSerializer();
}

class _$MajorVOSerializer implements PrimitiveSerializer<MajorVO> {
  @override
  final Iterable<Type> types = const [MajorVO, _$MajorVO];

  @override
  final String wireName = r'MajorVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MajorVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.majorName != null) {
      yield r'majorName';
      yield serializers.serialize(
        object.majorName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MajorVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MajorVOBuilder result,
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
        case r'majorName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.majorName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MajorVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MajorVOBuilder();
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

