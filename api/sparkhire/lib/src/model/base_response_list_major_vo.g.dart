// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_major_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListMajorVO extends BaseResponseListMajorVO {
  @override
  final int? code;
  @override
  final BuiltList<MajorVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListMajorVO(
          [void Function(BaseResponseListMajorVOBuilder)? updates]) =>
      (BaseResponseListMajorVOBuilder()..update(updates))._build();

  _$BaseResponseListMajorVO._({this.code, this.data, this.message}) : super._();
  @override
  BaseResponseListMajorVO rebuild(
          void Function(BaseResponseListMajorVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListMajorVOBuilder toBuilder() =>
      BaseResponseListMajorVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListMajorVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListMajorVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListMajorVOBuilder
    implements
        Builder<BaseResponseListMajorVO, BaseResponseListMajorVOBuilder> {
  _$BaseResponseListMajorVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<MajorVO>? _data;
  ListBuilder<MajorVO> get data => _$this._data ??= ListBuilder<MajorVO>();
  set data(ListBuilder<MajorVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListMajorVOBuilder() {
    BaseResponseListMajorVO._defaults(this);
  }

  BaseResponseListMajorVOBuilder get _$this {
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
  void replace(BaseResponseListMajorVO other) {
    _$v = other as _$BaseResponseListMajorVO;
  }

  @override
  void update(void Function(BaseResponseListMajorVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListMajorVO build() => _build();

  _$BaseResponseListMajorVO _build() {
    _$BaseResponseListMajorVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListMajorVO._(
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
            r'BaseResponseListMajorVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
