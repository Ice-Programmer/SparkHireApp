//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wish_career_add_request.g.dart';

/// WishCareerAddRequest
///
/// Properties:
/// * [careerId] 
/// * [industryId] 
/// * [salaryExpectation] 
@BuiltValue()
abstract class WishCareerAddRequest implements Built<WishCareerAddRequest, WishCareerAddRequestBuilder> {
  @BuiltValueField(wireName: r'careerId')
  int? get careerId;

  @BuiltValueField(wireName: r'industryId')
  int? get industryId;

  @BuiltValueField(wireName: r'salaryExpectation')
  String? get salaryExpectation;

  WishCareerAddRequest._();

  factory WishCareerAddRequest([void updates(WishCareerAddRequestBuilder b)]) = _$WishCareerAddRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WishCareerAddRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WishCareerAddRequest> get serializer => _$WishCareerAddRequestSerializer();
}

class _$WishCareerAddRequestSerializer implements PrimitiveSerializer<WishCareerAddRequest> {
  @override
  final Iterable<Type> types = const [WishCareerAddRequest, _$WishCareerAddRequest];

  @override
  final String wireName = r'WishCareerAddRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WishCareerAddRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.careerId != null) {
      yield r'careerId';
      yield serializers.serialize(
        object.careerId,
        specifiedType: const FullType(int),
      );
    }
    if (object.industryId != null) {
      yield r'industryId';
      yield serializers.serialize(
        object.industryId,
        specifiedType: const FullType(int),
      );
    }
    if (object.salaryExpectation != null) {
      yield r'salaryExpectation';
      yield serializers.serialize(
        object.salaryExpectation,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WishCareerAddRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WishCareerAddRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'careerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.careerId = valueDes;
          break;
        case r'industryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.industryId = valueDes;
          break;
        case r'salaryExpectation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.salaryExpectation = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WishCareerAddRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WishCareerAddRequestBuilder();
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

