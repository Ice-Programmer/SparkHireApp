//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_request.g.dart';

/// DeleteRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class DeleteRequest implements Built<DeleteRequest, DeleteRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  DeleteRequest._();

  factory DeleteRequest([void updates(DeleteRequestBuilder b)]) = _$DeleteRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteRequest> get serializer => _$DeleteRequestSerializer();
}

class _$DeleteRequestSerializer implements PrimitiveSerializer<DeleteRequest> {
  @override
  final Iterable<Type> types = const [DeleteRequest, _$DeleteRequest];

  @override
  final String wireName = r'DeleteRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteRequestBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteRequestBuilder();
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

