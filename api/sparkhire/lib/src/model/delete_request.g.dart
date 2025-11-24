// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteRequest extends DeleteRequest {
  @override
  final int? id;

  factory _$DeleteRequest([void Function(DeleteRequestBuilder)? updates]) =>
      (DeleteRequestBuilder()..update(updates))._build();

  _$DeleteRequest._({this.id}) : super._();
  @override
  DeleteRequest rebuild(void Function(DeleteRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteRequestBuilder toBuilder() => DeleteRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteRequest && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteRequest')..add('id', id))
        .toString();
  }
}

class DeleteRequestBuilder
    implements Builder<DeleteRequest, DeleteRequestBuilder> {
  _$DeleteRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DeleteRequestBuilder() {
    DeleteRequest._defaults(this);
  }

  DeleteRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteRequest other) {
    _$v = other as _$DeleteRequest;
  }

  @override
  void update(void Function(DeleteRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteRequest build() => _build();

  _$DeleteRequest _build() {
    final _$result = _$v ??
        _$DeleteRequest._(
          id: id,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
