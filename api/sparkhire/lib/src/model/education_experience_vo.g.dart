// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_experience_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EducationExperienceVO extends EducationExperienceVO {
  @override
  final int? id;
  @override
  final int? schoolId;
  @override
  final String? schoolName;
  @override
  final int? educationType;
  @override
  final int? beginYear;
  @override
  final int? endYear;
  @override
  final int? majorId;
  @override
  final String? majorName;
  @override
  final String? activity;

  factory _$EducationExperienceVO(
          [void Function(EducationExperienceVOBuilder)? updates]) =>
      (EducationExperienceVOBuilder()..update(updates))._build();

  _$EducationExperienceVO._(
      {this.id,
      this.schoolId,
      this.schoolName,
      this.educationType,
      this.beginYear,
      this.endYear,
      this.majorId,
      this.majorName,
      this.activity})
      : super._();
  @override
  EducationExperienceVO rebuild(
          void Function(EducationExperienceVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationExperienceVOBuilder toBuilder() =>
      EducationExperienceVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EducationExperienceVO &&
        id == other.id &&
        schoolId == other.schoolId &&
        schoolName == other.schoolName &&
        educationType == other.educationType &&
        beginYear == other.beginYear &&
        endYear == other.endYear &&
        majorId == other.majorId &&
        majorName == other.majorName &&
        activity == other.activity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, schoolId.hashCode);
    _$hash = $jc(_$hash, schoolName.hashCode);
    _$hash = $jc(_$hash, educationType.hashCode);
    _$hash = $jc(_$hash, beginYear.hashCode);
    _$hash = $jc(_$hash, endYear.hashCode);
    _$hash = $jc(_$hash, majorId.hashCode);
    _$hash = $jc(_$hash, majorName.hashCode);
    _$hash = $jc(_$hash, activity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EducationExperienceVO')
          ..add('id', id)
          ..add('schoolId', schoolId)
          ..add('schoolName', schoolName)
          ..add('educationType', educationType)
          ..add('beginYear', beginYear)
          ..add('endYear', endYear)
          ..add('majorId', majorId)
          ..add('majorName', majorName)
          ..add('activity', activity))
        .toString();
  }
}

class EducationExperienceVOBuilder
    implements Builder<EducationExperienceVO, EducationExperienceVOBuilder> {
  _$EducationExperienceVO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _schoolId;
  int? get schoolId => _$this._schoolId;
  set schoolId(int? schoolId) => _$this._schoolId = schoolId;

  String? _schoolName;
  String? get schoolName => _$this._schoolName;
  set schoolName(String? schoolName) => _$this._schoolName = schoolName;

  int? _educationType;
  int? get educationType => _$this._educationType;
  set educationType(int? educationType) =>
      _$this._educationType = educationType;

  int? _beginYear;
  int? get beginYear => _$this._beginYear;
  set beginYear(int? beginYear) => _$this._beginYear = beginYear;

  int? _endYear;
  int? get endYear => _$this._endYear;
  set endYear(int? endYear) => _$this._endYear = endYear;

  int? _majorId;
  int? get majorId => _$this._majorId;
  set majorId(int? majorId) => _$this._majorId = majorId;

  String? _majorName;
  String? get majorName => _$this._majorName;
  set majorName(String? majorName) => _$this._majorName = majorName;

  String? _activity;
  String? get activity => _$this._activity;
  set activity(String? activity) => _$this._activity = activity;

  EducationExperienceVOBuilder() {
    EducationExperienceVO._defaults(this);
  }

  EducationExperienceVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _schoolId = $v.schoolId;
      _schoolName = $v.schoolName;
      _educationType = $v.educationType;
      _beginYear = $v.beginYear;
      _endYear = $v.endYear;
      _majorId = $v.majorId;
      _majorName = $v.majorName;
      _activity = $v.activity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EducationExperienceVO other) {
    _$v = other as _$EducationExperienceVO;
  }

  @override
  void update(void Function(EducationExperienceVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EducationExperienceVO build() => _build();

  _$EducationExperienceVO _build() {
    final _$result = _$v ??
        _$EducationExperienceVO._(
          id: id,
          schoolId: schoolId,
          schoolName: schoolName,
          educationType: educationType,
          beginYear: beginYear,
          endYear: endYear,
          majorId: majorId,
          majorName: majorName,
          activity: activity,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
