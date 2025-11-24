// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qualification_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QualificationVO extends QualificationVO {
  @override
  final String? qualificationType;
  @override
  final BuiltList<QualificationDetail>? qualificationDetailList;

  factory _$QualificationVO([void Function(QualificationVOBuilder)? updates]) =>
      (QualificationVOBuilder()..update(updates))._build();

  _$QualificationVO._({this.qualificationType, this.qualificationDetailList})
      : super._();
  @override
  QualificationVO rebuild(void Function(QualificationVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QualificationVOBuilder toBuilder() => QualificationVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QualificationVO &&
        qualificationType == other.qualificationType &&
        qualificationDetailList == other.qualificationDetailList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, qualificationType.hashCode);
    _$hash = $jc(_$hash, qualificationDetailList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QualificationVO')
          ..add('qualificationType', qualificationType)
          ..add('qualificationDetailList', qualificationDetailList))
        .toString();
  }
}

class QualificationVOBuilder
    implements Builder<QualificationVO, QualificationVOBuilder> {
  _$QualificationVO? _$v;

  String? _qualificationType;
  String? get qualificationType => _$this._qualificationType;
  set qualificationType(String? qualificationType) =>
      _$this._qualificationType = qualificationType;

  ListBuilder<QualificationDetail>? _qualificationDetailList;
  ListBuilder<QualificationDetail> get qualificationDetailList =>
      _$this._qualificationDetailList ??= ListBuilder<QualificationDetail>();
  set qualificationDetailList(
          ListBuilder<QualificationDetail>? qualificationDetailList) =>
      _$this._qualificationDetailList = qualificationDetailList;

  QualificationVOBuilder() {
    QualificationVO._defaults(this);
  }

  QualificationVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _qualificationType = $v.qualificationType;
      _qualificationDetailList = $v.qualificationDetailList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QualificationVO other) {
    _$v = other as _$QualificationVO;
  }

  @override
  void update(void Function(QualificationVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QualificationVO build() => _build();

  _$QualificationVO _build() {
    _$QualificationVO _$result;
    try {
      _$result = _$v ??
          _$QualificationVO._(
            qualificationType: qualificationType,
            qualificationDetailList: _qualificationDetailList?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'qualificationDetailList';
        _qualificationDetailList?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'QualificationVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
