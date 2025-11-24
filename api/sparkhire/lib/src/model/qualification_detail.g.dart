// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qualification_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QualificationDetail extends QualificationDetail {
  @override
  final int? id;
  @override
  final String? qualificationName;

  factory _$QualificationDetail(
          [void Function(QualificationDetailBuilder)? updates]) =>
      (QualificationDetailBuilder()..update(updates))._build();

  _$QualificationDetail._({this.id, this.qualificationName}) : super._();
  @override
  QualificationDetail rebuild(
          void Function(QualificationDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QualificationDetailBuilder toBuilder() =>
      QualificationDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QualificationDetail &&
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
    return (newBuiltValueToStringHelper(r'QualificationDetail')
          ..add('id', id)
          ..add('qualificationName', qualificationName))
        .toString();
  }
}

class QualificationDetailBuilder
    implements Builder<QualificationDetail, QualificationDetailBuilder> {
  _$QualificationDetail? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _qualificationName;
  String? get qualificationName => _$this._qualificationName;
  set qualificationName(String? qualificationName) =>
      _$this._qualificationName = qualificationName;

  QualificationDetailBuilder() {
    QualificationDetail._defaults(this);
  }

  QualificationDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _qualificationName = $v.qualificationName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QualificationDetail other) {
    _$v = other as _$QualificationDetail;
  }

  @override
  void update(void Function(QualificationDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QualificationDetail build() => _build();

  _$QualificationDetail _build() {
    final _$result = _$v ??
        _$QualificationDetail._(
          id: id,
          qualificationName: qualificationName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
