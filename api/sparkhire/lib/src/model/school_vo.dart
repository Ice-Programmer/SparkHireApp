//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'school_vo.g.dart';

/// SchoolVO
///
/// Properties:
/// * [id] 
/// * [schoolName] 
@BuiltValue()
abstract class SchoolVO implements Built<SchoolVO, SchoolVOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'schoolName')
  String? get schoolName;

  SchoolVO._();

  factory SchoolVO([void updates(SchoolVOBuilder b)]) = _$SchoolVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SchoolVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SchoolVO> get serializer => _$SchoolVOSerializer();
}

class _$SchoolVOSerializer implements PrimitiveSerializer<SchoolVO> {
  @override
  final Iterable<Type> types = const [SchoolVO, _$SchoolVO];

  @override
  final String wireName = r'SchoolVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SchoolVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.schoolName != null) {
      yield r'schoolName';
      yield serializers.serialize(
        object.schoolName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SchoolVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SchoolVOBuilder result,
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
        case r'schoolName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.schoolName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SchoolVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SchoolVOBuilder();
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

