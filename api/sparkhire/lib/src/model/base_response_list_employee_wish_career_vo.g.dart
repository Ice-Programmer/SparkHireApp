// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_employee_wish_career_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListEmployeeWishCareerVO
    extends BaseResponseListEmployeeWishCareerVO {
  @override
  final int? code;
  @override
  final BuiltList<EmployeeWishCareerVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListEmployeeWishCareerVO(
          [void Function(BaseResponseListEmployeeWishCareerVOBuilder)?
              updates]) =>
      (BaseResponseListEmployeeWishCareerVOBuilder()..update(updates))._build();

  _$BaseResponseListEmployeeWishCareerVO._({this.code, this.data, this.message})
      : super._();
  @override
  BaseResponseListEmployeeWishCareerVO rebuild(
          void Function(BaseResponseListEmployeeWishCareerVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListEmployeeWishCareerVOBuilder toBuilder() =>
      BaseResponseListEmployeeWishCareerVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListEmployeeWishCareerVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListEmployeeWishCareerVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListEmployeeWishCareerVOBuilder
    implements
        Builder<BaseResponseListEmployeeWishCareerVO,
            BaseResponseListEmployeeWishCareerVOBuilder> {
  _$BaseResponseListEmployeeWishCareerVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<EmployeeWishCareerVO>? _data;
  ListBuilder<EmployeeWishCareerVO> get data =>
      _$this._data ??= ListBuilder<EmployeeWishCareerVO>();
  set data(ListBuilder<EmployeeWishCareerVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListEmployeeWishCareerVOBuilder() {
    BaseResponseListEmployeeWishCareerVO._defaults(this);
  }

  BaseResponseListEmployeeWishCareerVOBuilder get _$this {
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
  void replace(BaseResponseListEmployeeWishCareerVO other) {
    _$v = other as _$BaseResponseListEmployeeWishCareerVO;
  }

  @override
  void update(
      void Function(BaseResponseListEmployeeWishCareerVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListEmployeeWishCareerVO build() => _build();

  _$BaseResponseListEmployeeWishCareerVO _build() {
    _$BaseResponseListEmployeeWishCareerVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListEmployeeWishCareerVO._(
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
            r'BaseResponseListEmployeeWishCareerVO',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
