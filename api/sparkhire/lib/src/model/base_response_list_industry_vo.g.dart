// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_industry_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListIndustryVO extends BaseResponseListIndustryVO {
  @override
  final int? code;
  @override
  final BuiltList<IndustryVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListIndustryVO(
          [void Function(BaseResponseListIndustryVOBuilder)? updates]) =>
      (BaseResponseListIndustryVOBuilder()..update(updates))._build();

  _$BaseResponseListIndustryVO._({this.code, this.data, this.message})
      : super._();
  @override
  BaseResponseListIndustryVO rebuild(
          void Function(BaseResponseListIndustryVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListIndustryVOBuilder toBuilder() =>
      BaseResponseListIndustryVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListIndustryVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListIndustryVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListIndustryVOBuilder
    implements
        Builder<BaseResponseListIndustryVO, BaseResponseListIndustryVOBuilder> {
  _$BaseResponseListIndustryVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<IndustryVO>? _data;
  ListBuilder<IndustryVO> get data =>
      _$this._data ??= ListBuilder<IndustryVO>();
  set data(ListBuilder<IndustryVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListIndustryVOBuilder() {
    BaseResponseListIndustryVO._defaults(this);
  }

  BaseResponseListIndustryVOBuilder get _$this {
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
  void replace(BaseResponseListIndustryVO other) {
    _$v = other as _$BaseResponseListIndustryVO;
  }

  @override
  void update(void Function(BaseResponseListIndustryVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListIndustryVO build() => _build();

  _$BaseResponseListIndustryVO _build() {
    _$BaseResponseListIndustryVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListIndustryVO._(
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
            r'BaseResponseListIndustryVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
