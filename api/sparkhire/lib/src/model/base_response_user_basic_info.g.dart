// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user_basic_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseUserBasicInfo extends BaseResponseUserBasicInfo {
  @override
  final int? code;
  @override
  final UserBasicInfo? data;
  @override
  final String? message;

  factory _$BaseResponseUserBasicInfo(
          [void Function(BaseResponseUserBasicInfoBuilder)? updates]) =>
      (BaseResponseUserBasicInfoBuilder()..update(updates))._build();

  _$BaseResponseUserBasicInfo._({this.code, this.data, this.message})
      : super._();
  @override
  BaseResponseUserBasicInfo rebuild(
          void Function(BaseResponseUserBasicInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseUserBasicInfoBuilder toBuilder() =>
      BaseResponseUserBasicInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseUserBasicInfo &&
        code == other.code &&
        data == other.data &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseResponseUserBasicInfo')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseUserBasicInfoBuilder
    implements
        Builder<BaseResponseUserBasicInfo, BaseResponseUserBasicInfoBuilder> {
  _$BaseResponseUserBasicInfo? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  UserBasicInfoBuilder? _data;
  UserBasicInfoBuilder get data => _$this._data ??= UserBasicInfoBuilder();
  set data(UserBasicInfoBuilder? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseUserBasicInfoBuilder() {
    BaseResponseUserBasicInfo._defaults(this);
  }

  BaseResponseUserBasicInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _data = $v.data?.toBuilder();
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BaseResponseUserBasicInfo other) {
    _$v = other as _$BaseResponseUserBasicInfo;
  }

  @override
  void update(void Function(BaseResponseUserBasicInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseUserBasicInfo build() => _build();

  _$BaseResponseUserBasicInfo _build() {
    _$BaseResponseUserBasicInfo _$result;
    try {
      _$result = _$v ??
          _$BaseResponseUserBasicInfo._(
            code: code,
            data: _data?.build(),
            message: message,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BaseResponseUserBasicInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
