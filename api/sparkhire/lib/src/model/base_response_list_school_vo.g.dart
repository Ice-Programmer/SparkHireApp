// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_school_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListSchoolVO extends BaseResponseListSchoolVO {
  @override
  final int? code;
  @override
  final BuiltList<SchoolVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListSchoolVO(
          [void Function(BaseResponseListSchoolVOBuilder)? updates]) =>
      (BaseResponseListSchoolVOBuilder()..update(updates))._build();

  _$BaseResponseListSchoolVO._({this.code, this.data, this.message})
      : super._();
  @override
  BaseResponseListSchoolVO rebuild(
          void Function(BaseResponseListSchoolVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListSchoolVOBuilder toBuilder() =>
      BaseResponseListSchoolVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListSchoolVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListSchoolVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListSchoolVOBuilder
    implements
        Builder<BaseResponseListSchoolVO, BaseResponseListSchoolVOBuilder> {
  _$BaseResponseListSchoolVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<SchoolVO>? _data;
  ListBuilder<SchoolVO> get data => _$this._data ??= ListBuilder<SchoolVO>();
  set data(ListBuilder<SchoolVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListSchoolVOBuilder() {
    BaseResponseListSchoolVO._defaults(this);
  }

  BaseResponseListSchoolVOBuilder get _$this {
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
  void replace(BaseResponseListSchoolVO other) {
    _$v = other as _$BaseResponseListSchoolVO;
  }

  @override
  void update(void Function(BaseResponseListSchoolVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListSchoolVO build() => _build();

  _$BaseResponseListSchoolVO _build() {
    _$BaseResponseListSchoolVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListSchoolVO._(
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
            r'BaseResponseListSchoolVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
