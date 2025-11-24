// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_city_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BaseResponseListCityVO extends BaseResponseListCityVO {
  @override
  final int? code;
  @override
  final BuiltList<CityVO>? data;
  @override
  final String? message;

  factory _$BaseResponseListCityVO(
          [void Function(BaseResponseListCityVOBuilder)? updates]) =>
      (BaseResponseListCityVOBuilder()..update(updates))._build();

  _$BaseResponseListCityVO._({this.code, this.data, this.message}) : super._();
  @override
  BaseResponseListCityVO rebuild(
          void Function(BaseResponseListCityVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseListCityVOBuilder toBuilder() =>
      BaseResponseListCityVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponseListCityVO &&
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
    return (newBuiltValueToStringHelper(r'BaseResponseListCityVO')
          ..add('code', code)
          ..add('data', data)
          ..add('message', message))
        .toString();
  }
}

class BaseResponseListCityVOBuilder
    implements Builder<BaseResponseListCityVO, BaseResponseListCityVOBuilder> {
  _$BaseResponseListCityVO? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  ListBuilder<CityVO>? _data;
  ListBuilder<CityVO> get data => _$this._data ??= ListBuilder<CityVO>();
  set data(ListBuilder<CityVO>? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BaseResponseListCityVOBuilder() {
    BaseResponseListCityVO._defaults(this);
  }

  BaseResponseListCityVOBuilder get _$this {
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
  void replace(BaseResponseListCityVO other) {
    _$v = other as _$BaseResponseListCityVO;
  }

  @override
  void update(void Function(BaseResponseListCityVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponseListCityVO build() => _build();

  _$BaseResponseListCityVO _build() {
    _$BaseResponseListCityVO _$result;
    try {
      _$result = _$v ??
          _$BaseResponseListCityVO._(
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
            r'BaseResponseListCityVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
