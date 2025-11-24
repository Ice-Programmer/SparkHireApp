// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_qualification_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmployeeQualificationVO extends EmployeeQualificationVO {
  @override
  final int? id;
  @override
  final String? qualificationName;

  factory _$EmployeeQualificationVO(
          [void Function(EmployeeQualificationVOBuilder)? updates]) =>
      (EmployeeQualificationVOBuilder()..update(updates))._build();

  _$EmployeeQualificationVO._({this.id, this.qualificationName}) : super._();
  @override
  EmployeeQualificationVO rebuild(
          void Function(EmployeeQualificationVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeQualificationVOBuilder toBuilder() =>
      EmployeeQualificationVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeeQualificationVO &&
        id == other.id &&
        qualificationName == other.qualificationName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, qualificationName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmployeeQualificationVO')
          ..add('id', id)
          ..add('qualificationName', qualificationName))
        .toString();
  }
}

class EmployeeQualificationVOBuilder
    implements
        Builder<EmployeeQualificationVO, EmployeeQualificationVOBuilder> {
  _$EmployeeQualificationVO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _qualificationName;
  String? get qualificationName => _$this._qualificationName;
  set qualificationName(String? qualificationName) =>
      _$this._qualificationName = qualificationName;

  EmployeeQualificationVOBuilder() {
    EmployeeQualificationVO._defaults(this);
  }

  EmployeeQualificationVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _qualificationName = $v.qualificationName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmployeeQualificationVO other) {
    _$v = other as _$EmployeeQualificationVO;
  }

  @override
  void update(void Function(EmployeeQualificationVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmployeeQualificationVO build() => _build();

  _$EmployeeQualificationVO _build() {
    final _$result = _$v ??
        _$EmployeeQualificationVO._(
          id: id,
          qualificationName: qualificationName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
