//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:sparkhire_api/src/model/qualification_detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'qualification_vo.g.dart';

/// QualificationVO
///
/// Properties:
/// * [qualificationType] 
/// * [qualificationDetailList] 
@BuiltValue()
abstract class QualificationVO implements Built<QualificationVO, QualificationVOBuilder> {
  @BuiltValueField(wireName: r'qualificationType')
  String? get qualificationType;

  @BuiltValueField(wireName: r'qualificationDetailList')
  BuiltList<QualificationDetail>? get qualificationDetailList;

  QualificationVO._();

  factory QualificationVO([void updates(QualificationVOBuilder b)]) = _$QualificationVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QualificationVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QualificationVO> get serializer => _$QualificationVOSerializer();
}

class _$QualificationVOSerializer implements PrimitiveSerializer<QualificationVO> {
  @override
  final Iterable<Type> types = const [QualificationVO, _$QualificationVO];

  @override
  final String wireName = r'QualificationVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QualificationVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.qualificationType != null) {
      yield r'qualificationType';
      yield serializers.serialize(
        object.qualificationType,
        specifiedType: const FullType(String),
      );
    }
    if (object.qualificationDetailList != null) {
      yield r'qualificationDetailList';
      yield serializers.serialize(
        object.qualificationDetailList,
        specifiedType: const FullType(BuiltList, [FullType(QualificationDetail)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QualificationVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QualificationVOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'qualificationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.qualificationType = valueDes;
          break;
        case r'qualificationDetailList':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(QualificationDetail)]),
          ) as BuiltList<QualificationDetail>;
          result.qualificationDetailList.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QualificationVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QualificationVOBuilder();
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

