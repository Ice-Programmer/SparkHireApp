// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SchoolVO extends SchoolVO {
  @override
  final int? id;
  @override
  final String? schoolName;

  factory _$SchoolVO([void Function(SchoolVOBuilder)? updates]) =>
      (SchoolVOBuilder()..update(updates))._build();

  _$SchoolVO._({this.id, this.schoolName}) : super._();
  @override
  SchoolVO rebuild(void Function(SchoolVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchoolVOBuilder toBuilder() => SchoolVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SchoolVO &&
        id == other.id &&
        schoolName == other.schoolName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, schoolName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SchoolVO')
          ..add('id', id)
          ..add('schoolName', schoolName))
        .toString();
  }
}

class SchoolVOBuilder implements Builder<SchoolVO, SchoolVOBuilder> {
  _$SchoolVO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _schoolName;
  String? get schoolName => _$this._schoolName;
  set schoolName(String? schoolName) => _$this._schoolName = schoolName;

  SchoolVOBuilder() {
    SchoolVO._defaults(this);
  }

  SchoolVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _schoolName = $v.schoolName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SchoolVO other) {
    _$v = other as _$SchoolVO;
  }

  @override
  void update(void Function(SchoolVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SchoolVO build() => _build();

  _$SchoolVO _build() {
    final _$result = _$v ??
        _$SchoolVO._(
          id: id,
          schoolName: schoolName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
