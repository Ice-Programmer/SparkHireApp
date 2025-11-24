// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CareerDetail extends CareerDetail {
  @override
  final int? id;
  @override
  final String? careerName;
  @override
  final String? description;

  factory _$CareerDetail([void Function(CareerDetailBuilder)? updates]) =>
      (CareerDetailBuilder()..update(updates))._build();

  _$CareerDetail._({this.id, this.careerName, this.description}) : super._();
  @override
  CareerDetail rebuild(void Function(CareerDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CareerDetailBuilder toBuilder() => CareerDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CareerDetail &&
        id == other.id &&
        careerName == other.careerName &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, careerName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CareerDetail')
          ..add('id', id)
          ..add('careerName', careerName)
          ..add('description', description))
        .toString();
  }
}

class CareerDetailBuilder
    implements Builder<CareerDetail, CareerDetailBuilder> {
  _$CareerDetail? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _careerName;
  String? get careerName => _$this._careerName;
  set careerName(String? careerName) => _$this._careerName = careerName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CareerDetailBuilder() {
    CareerDetail._defaults(this);
  }

  CareerDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _careerName = $v.careerName;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CareerDetail other) {
    _$v = other as _$CareerDetail;
  }

  @override
  void update(void Function(CareerDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CareerDetail build() => _build();

  _$CareerDetail _build() {
    final _$result = _$v ??
        _$CareerDetail._(
          id: id,
          careerName: careerName,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
