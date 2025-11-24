//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:sparkhire_api/src/model/career_detail.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'career_vo.g.dart';

/// CareerVO
///
/// Properties:
/// * [careerTypeName] 
/// * [careerDetailList] 
@BuiltValue()
abstract class CareerVO implements Built<CareerVO, CareerVOBuilder> {
  @BuiltValueField(wireName: r'careerTypeName')
  String? get careerTypeName;

  @BuiltValueField(wireName: r'careerDetailList')
  BuiltList<CareerDetail>? get careerDetailList;

  CareerVO._();

  factory CareerVO([void updates(CareerVOBuilder b)]) = _$CareerVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CareerVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CareerVO> get serializer => _$CareerVOSerializer();
}

class _$CareerVOSerializer implements PrimitiveSerializer<CareerVO> {
  @override
  final Iterable<Type> types = const [CareerVO, _$CareerVO];

  @override
  final String wireName = r'CareerVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CareerVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.careerTypeName != null) {
      yield r'careerTypeName';
      yield serializers.serialize(
        object.careerTypeName,
        specifiedType: const FullType(String),
      );
    }
    if (object.careerDetailList != null) {
      yield r'careerDetailList';
      yield serializers.serialize(
        object.careerDetailList,
        specifiedType: const FullType(BuiltList, [FullType(CareerDetail)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CareerVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CareerVOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'careerTypeName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.careerTypeName = valueDes;
          break;
        case r'careerDetailList':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CareerDetail)]),
          ) as BuiltList<CareerDetail>;
          result.careerDetailList.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CareerVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CareerVOBuilder();
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

