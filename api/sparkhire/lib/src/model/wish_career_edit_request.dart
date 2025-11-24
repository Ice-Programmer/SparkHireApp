//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wish_career_edit_request.g.dart';

/// WishCareerEditRequest
///
/// Properties:
/// * [id] 
/// * [careerId] 
/// * [industryId] 
/// * [salaryExpectation] 
@BuiltValue()
abstract class WishCareerEditRequest implements Built<WishCareerEditRequest, WishCareerEditRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'careerId')
  int? get careerId;

  @BuiltValueField(wireName: r'industryId')
  int? get industryId;

  @BuiltValueField(wireName: r'salaryExpectation')
  String? get salaryExpectation;

  WishCareerEditRequest._();

  factory WishCareerEditRequest([void updates(WishCareerEditRequestBuilder b)]) = _$WishCareerEditRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WishCareerEditRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WishCareerEditRequest> get serializer => _$WishCareerEditRequestSerializer();
}

class _$WishCareerEditRequestSerializer implements PrimitiveSerializer<WishCareerEditRequest> {
  @override
  final Iterable<Type> types = const [WishCareerEditRequest, _$WishCareerEditRequest];

  @override
  final String wireName = r'WishCareerEditRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WishCareerEditRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
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
    WishCareerEditRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WishCareerEditRequestBuilder result,
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
  WishCareerEditRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WishCareerEditRequestBuilder();
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

