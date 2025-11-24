// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_career_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListCareerVO extends BaseResponseListCareerVO {
  @override
  final int? code;
  @override
  final BuiltList<CareerVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListCareerVO(
          [void Function(BaseResponseListCareerVOBuilder)? updates]) =>
      (BaseResponseListCareerVOBuilder()..update(updates))._build();

  _$BaseResponseListCareerVO._({this.code, this.data, this.message})
      : super._();
  @override
  BaseResponseListCareerVO rebuild(
          void Function(BaseResponseListCareerVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListCareerVOBuilder toBuilder() =>
      BaseResponseListCareerVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListCareerVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListCareerVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListCareerVOBuilder
    implements
        Builder<BaseResponseListCareerVO, BaseResponseListCareerVOBuilder> {
  _$BaseResponseListCareerVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<CareerVO>? _data;
  ListBuilder<CareerVO> get data => _$this._data ??= ListBuilder<CareerVO>();
  set data(ListBuilder<CareerVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListCareerVOBuilder() {
    BaseResponseListCareerVO._defaults(this);
  }

  BaseResponseListCareerVOBuilder get _$this {
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
  void replace(BaseResponseListCareerVO other) {
    _$v = other as _$BaseResponseListCareerVO;
  }

  @override
  void update(void Function(BaseResponseListCareerVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListCareerVO build() => _build();

  _$BaseResponseListCareerVO _build() {
    _$BaseResponseListCareerVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListCareerVO._(
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
            r'BaseResponseListCareerVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
