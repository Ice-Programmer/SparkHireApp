//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_mail_login_request.g.dart';

/// UserMailLoginRequest
///
/// Properties:
/// * [email] 
/// * [verifyCode] 
@BuiltValue()
abstract class UserMailLoginRequest implements Built<UserMailLoginRequest, UserMailLoginRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'verifyCode')
  String? get verifyCode;

  UserMailLoginRequest._();

  factory UserMailLoginRequest([void updates(UserMailLoginRequestBuilder b)]) = _$UserMailLoginRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserMailLoginRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserMailLoginRequest> get serializer => _$UserMailLoginRequestSerializer();
}

class _$UserMailLoginRequestSerializer implements PrimitiveSerializer<UserMailLoginRequest> {
  @override
  final Iterable<Type> types = const [UserMailLoginRequest, _$UserMailLoginRequest];

  @override
  final String wireName = r'UserMailLoginRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserMailLoginRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.verifyCode != null) {
      yield r'verifyCode';
      yield serializers.serialize(
        object.verifyCode,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserMailLoginRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserMailLoginRequestBuilder result,
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
  UserMailLoginRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserMailLoginRequestBuilder();
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

