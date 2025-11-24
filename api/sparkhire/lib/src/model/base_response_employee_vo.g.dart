// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_employee_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseEmployeeVO extends BaseResponseEmployeeVO {
  @override
  final int? code;
  @override
  final EmployeeVO? data;
  @override
  final String? message;

  factory _$BaseResponseEmployeeVO(
          [void Function(BaseResponseEmployeeVOBuilder)? updates]) =>
      (BaseResponseEmployeeVOBuilder()..update(updates))._build();

  _$BaseResponseEmployeeVO._({this.code, this.data, this.message}) : super._();
  @override
  BaseResponseEmployeeVO rebuild(
          void Function(BaseResponseEmployeeVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseEmployeeVOBuilder toBuilder() =>
      BaseResponseEmployeeVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseEmployeeVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseEmployeeVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseEmployeeVOBuilder
    implements Builder<BaseResponseEmployeeVO, BaseResponseEmployeeVOBuilder> {
  _$BaseResponseEmployeeVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  EmployeeVOBuilder? _data;
  EmployeeVOBuilder get data => _$this._data ??= EmployeeVOBuilder();
  set data(EmployeeVOBuilder? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseEmployeeVOBuilder() {
    BaseResponseEmployeeVO._defaults(this);
  }

  BaseResponseEmployeeVOBuilder get _$this {
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
  void replace(BaseResponseEmployeeVO other) {
    _$v = other as _$BaseResponseEmployeeVO;
  }

  @override
  void update(void Function(BaseResponseEmployeeVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseEmployeeVO build() => _build();

  _$BaseResponseEmployeeVO _build() {
    _$BaseResponseEmployeeVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseEmployeeVO._(
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
            r'BaseResponseEmployeeVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
