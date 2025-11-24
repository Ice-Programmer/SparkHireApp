//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:sparkhire_api/src/model/industry_detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'industry_vo.g.dart';

/// IndustryVO
///
/// Properties:
/// * [industryType] 
/// * [industryDetails] 
@BuiltValue()
abstract class IndustryVO implements Built<IndustryVO, IndustryVOBuilder> {
  @BuiltValueField(wireName: r'industryType')
  String? get industryType;

  @BuiltValueField(wireName: r'industryDetails')
  BuiltList<IndustryDetail>? get industryDetails;

  IndustryVO._();

  factory IndustryVO([void updates(IndustryVOBuilder b)]) = _$IndustryVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IndustryVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IndustryVO> get serializer => _$IndustryVOSerializer();
}

class _$IndustryVOSerializer implements PrimitiveSerializer<IndustryVO> {
  @override
  final Iterable<Type> types = const [IndustryVO, _$IndustryVO];

  @override
  final String wireName = r'IndustryVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IndustryVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.industryType != null) {
      yield r'industryType';
      yield serializers.serialize(
        object.industryType,
        specifiedType: const FullType(String),
      );
    }
    if (object.industryDetails != null) {
      yield r'industryDetails';
      yield serializers.serialize(
        object.industryDetails,
        specifiedType: const FullType(BuiltList, [FullType(IndustryDetail)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    IndustryVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IndustryVOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'industryType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.industryType = valueDes;
          break;
        case r'industryDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(IndustryDetail)]),
          ) as BuiltList<IndustryDetail>;
          result.industryDetails.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IndustryVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IndustryVOBuilder();
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

