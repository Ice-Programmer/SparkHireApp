// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CareerVO extends CareerVO {
  @override
  final String? careerTypeName;
  @override
  final BuiltList<CareerDetail>? careerDetailList;

  factory _$CareerVO([void Function(CareerVOBuilder)? updates]) =>
      (CareerVOBuilder()..update(updates))._build();

  _$CareerVO._({this.careerTypeName, this.careerDetailList}) : super._();
  @override
  CareerVO rebuild(void Function(CareerVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CareerVOBuilder toBuilder() => CareerVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CareerVO &&
        careerTypeName == other.careerTypeName &&
        careerDetailList == other.careerDetailList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, careerTypeName.hashCode);
    _$hash = $jc(_$hash, careerDetailList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CareerVO')
          ..add('careerTypeName', careerTypeName)
          ..add('careerDetailList', careerDetailList))
        .toString();
  }
}

class CareerVOBuilder implements Builder<CareerVO, CareerVOBuilder> {
  _$CareerVO? _$v;

  String? _careerTypeName;
  String? get careerTypeName => _$this._careerTypeName;
  set careerTypeName(String? careerTypeName) =>
      _$this._careerTypeName = careerTypeName;

  ListBuilder<CareerDetail>? _careerDetailList;
  ListBuilder<CareerDetail> get careerDetailList =>
      _$this._careerDetailList ??= ListBuilder<CareerDetail>();
  set careerDetailList(ListBuilder<CareerDetail>? careerDetailList) =>
      _$this._careerDetailList = careerDetailList;

  CareerVOBuilder() {
    CareerVO._defaults(this);
  }

  CareerVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _careerTypeName = $v.careerTypeName;
      _careerDetailList = $v.careerDetailList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CareerVO other) {
    _$v = other as _$CareerVO;
  }

  @override
  void update(void Function(CareerVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CareerVO build() => _build();

  _$CareerVO _build() {
    _$CareerVO _$result;
    try {
      _$result = _$v ??
          _$CareerVO._(
            careerTypeName: careerTypeName,
            careerDetailList: _careerDetailList?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'careerDetailList';
        _careerDetailList?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CareerVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
