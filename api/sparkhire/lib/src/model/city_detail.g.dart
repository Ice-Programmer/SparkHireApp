// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CityDetail extends CityDetail {
  @override
  final int? id;
  @override
  final String? cityName;

  factory _$CityDetail([void Function(CityDetailBuilder)? updates]) =>
      (CityDetailBuilder()..update(updates))._build();

  _$CityDetail._({this.id, this.cityName}) : super._();
  @override
  CityDetail rebuild(void Function(CityDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityDetailBuilder toBuilder() => CityDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityDetail && id == other.id && cityName == other.cityName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, cityName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityDetail')
          ..add('id', id)
          ..add('cityName', cityName))
        .toString();
  }
}

class CityDetailBuilder implements Builder<CityDetail, CityDetailBuilder> {
  _$CityDetail? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _cityName;
  String? get cityName => _$this._cityName;
  set cityName(String? cityName) => _$this._cityName = cityName;

  CityDetailBuilder() {
    CityDetail._defaults(this);
  }

  CityDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _cityName = $v.cityName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CityDetail other) {
    _$v = other as _$CityDetail;
  }

  @override
  void update(void Function(CityDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityDetail build() => _build();

  _$CityDetail _build() {
    final _$result = _$v ??
        _$CityDetail._(
          id: id,
          cityName: cityName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
