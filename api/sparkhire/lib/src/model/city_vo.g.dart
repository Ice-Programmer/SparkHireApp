// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CityVO extends CityVO {
  @override
  final String? provinceName;
  @override
  final BuiltList<CityDetail>? cityDetailList;

  factory _$CityVO([void Function(CityVOBuilder)? updates]) =>
      (CityVOBuilder()..update(updates))._build();

  _$CityVO._({this.provinceName, this.cityDetailList}) : super._();
  @override
  CityVO rebuild(void Function(CityVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityVOBuilder toBuilder() => CityVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityVO &&
        provinceName == other.provinceName &&
        cityDetailList == other.cityDetailList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, provinceName.hashCode);
    _$hash = $jc(_$hash, cityDetailList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityVO')
          ..add('provinceName', provinceName)
          ..add('cityDetailList', cityDetailList))
        .toString();
  }
}

class CityVOBuilder implements Builder<CityVO, CityVOBuilder> {
  _$CityVO? _$v;

  String? _provinceName;
  String? get provinceName => _$this._provinceName;
  set provinceName(String? provinceName) => _$this._provinceName = provinceName;

  ListBuilder<CityDetail>? _cityDetailList;
  ListBuilder<CityDetail> get cityDetailList =>
      _$this._cityDetailList ??= ListBuilder<CityDetail>();
  set cityDetailList(ListBuilder<CityDetail>? cityDetailList) =>
      _$this._cityDetailList = cityDetailList;

  CityVOBuilder() {
    CityVO._defaults(this);
  }

  CityVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provinceName = $v.provinceName;
      _cityDetailList = $v.cityDetailList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CityVO other) {
    _$v = other as _$CityVO;
  }

  @override
  void update(void Function(CityVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityVO build() => _build();

  _$CityVO _build() {
    _$CityVO _$result;
    try {
      _$result = _$v ??
          _$CityVO._(
            provinceName: provinceName,
            cityDetailList: _cityDetailList?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cityDetailList';
        _cityDetailList?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CityVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
