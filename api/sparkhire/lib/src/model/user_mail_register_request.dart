//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_mail_register_request.g.dart';

/// UserMailRegisterRequest
///
/// Properties:
/// * [email] 
/// * [verifyCode] 
@BuiltValue()
abstract class UserMailRegisterRequest implements Built<UserMailRegisterRequest, UserMailRegisterRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'verifyCode')
  String get verifyCode;

  UserMailRegisterRequest._();

  factory UserMailRegisterRequest([void updates(UserMailRegisterRequestBuilder b)]) = _$UserMailRegisterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserMailRegisterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserMailRegisterRequest> get serializer => _$UserMailRegisterRequestSerializer();
}

class _$UserMailRegisterRequestSerializer implements PrimitiveSerializer<UserMailRegisterRequest> {
  @override
  final Iterable<Type> types = const [UserMailRegisterRequest, _$UserMailRegisterRequest];

  @override
  final String wireName = r'UserMailRegisterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserMailRegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'verifyCode';
    yield serializers.serialize(
      object.verifyCode,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserMailRegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserMailRegisterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'verifyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.verifyCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserMailRegisterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserMailRegisterRequestBuilder();
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

