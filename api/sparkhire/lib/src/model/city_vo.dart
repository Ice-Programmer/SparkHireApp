//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:sparkhire_api/src/model/city_detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'city_vo.g.dart';

/// CityVO
///
/// Properties:
/// * [provinceName] 
/// * [cityDetailList] 
@BuiltValue()
abstract class CityVO implements Built<CityVO, CityVOBuilder> {
  @BuiltValueField(wireName: r'provinceName')
  String? get provinceName;

  @BuiltValueField(wireName: r'cityDetailList')
  BuiltList<CityDetail>? get cityDetailList;

  CityVO._();

  factory CityVO([void updates(CityVOBuilder b)]) = _$CityVO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CityVOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CityVO> get serializer => _$CityVOSerializer();
}

class _$CityVOSerializer implements PrimitiveSerializer<CityVO> {
  @override
  final Iterable<Type> types = const [CityVO, _$CityVO];

  @override
  final String wireName = r'CityVO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CityVO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.provinceName != null) {
      yield r'provinceName';
      yield serializers.serialize(
        object.provinceName,
        specifiedType: const FullType(String),
      );
    }
    if (object.cityDetailList != null) {
      yield r'cityDetailList';
      yield serializers.serialize(
        object.cityDetailList,
        specifiedType: const FullType(BuiltList, [FullType(CityDetail)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CityVO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CityVOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'provinceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.provinceName = valueDes;
          break;
        case r'cityDetailList':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CityDetail)]),
          ) as BuiltList<CityDetail>;
          result.cityDetailList.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CityVO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CityVOBuilder();
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

