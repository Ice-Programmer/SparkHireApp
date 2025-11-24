// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_qualification_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListQualificationVO
    extends BaseResponseListQualificationVO {
  @override
  final int? code;
  @override
  final BuiltList<QualificationVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListQualificationVO(
          [void Function(BaseResponseListQualificationVOBuilder)? updates]) =>
      (BaseResponseListQualificationVOBuilder()..update(updates))._build();

  _$BaseResponseListQualificationVO._({this.code, this.data, this.message})
      : super._();
  @override
  BaseResponseListQualificationVO rebuild(
          void Function(BaseResponseListQualificationVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListQualificationVOBuilder toBuilder() =>
      BaseResponseListQualificationVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListQualificationVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListQualificationVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListQualificationVOBuilder
    implements
        Builder<BaseResponseListQualificationVO,
            BaseResponseListQualificationVOBuilder> {
  _$BaseResponseListQualificationVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<QualificationVO>? _data;
  ListBuilder<QualificationVO> get data =>
      _$this._data ??= ListBuilder<QualificationVO>();
  set data(ListBuilder<QualificationVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListQualificationVOBuilder() {
    BaseResponseListQualificationVO._defaults(this);
  }

  BaseResponseListQualificationVOBuilder get _$this {
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
  void replace(BaseResponseListQualificationVO other) {
    _$v = other as _$BaseResponseListQualificationVO;
  }

  @override
  void update(void Function(BaseResponseListQualificationVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListQualificationVO build() => _build();

  _$BaseResponseListQualificationVO _build() {
    _$BaseResponseListQualificationVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListQualificationVO._(
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
            r'BaseResponseListQualificationVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
