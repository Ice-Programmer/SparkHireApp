// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_exp_edit_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EducationExpEditRequest extends EducationExpEditRequest {
  @override
  final int? id;
  @override
  final int? schoolId;
  @override
  final int? educationType;
  @override
  final int? beginYear;
  @override
  final int? endYear;
  @override
  final int? majorId;
  @override
  final String? activity;

  factory _$EducationExpEditRequest(
          [void Function(EducationExpEditRequestBuilder)? updates]) =>
      (EducationExpEditRequestBuilder()..update(updates))._build();

  _$EducationExpEditRequest._(
      {this.id,
      this.schoolId,
      this.educationType,
      this.beginYear,
      this.endYear,
      this.majorId,
      this.activity})
      : super._();
  @override
  EducationExpEditRequest rebuild(
          void Function(EducationExpEditRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationExpEditRequestBuilder toBuilder() =>
      EducationExpEditRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EducationExpEditRequest &&
        id == other.id &&
        schoolId == other.schoolId &&
        educationType == other.educationType &&
        beginYear == other.beginYear &&
        endYear == other.endYear &&
        majorId == other.majorId &&
        activity == other.activity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, schoolId.hashCode);
    _$hash = $jc(_$hash, educationType.hashCode);
    _$hash = $jc(_$hash, beginYear.hashCode);
    _$hash = $jc(_$hash, endYear.hashCode);
    _$hash = $jc(_$hash, majorId.hashCode);
    _$hash = $jc(_$hash, activity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EducationExpEditRequest')
          ..add('id', id)
          ..add('schoolId', schoolId)
          ..add('educationType', educationType)
          ..add('beginYear', beginYear)
          ..add('endYear', endYear)
          ..add('majorId', majorId)
          ..add('activity', activity))
        .toString();
  }
}

class EducationExpEditRequestBuilder
    implements
        Builder<EducationExpEditRequest, EducationExpEditRequestBuilder> {
  _$EducationExpEditRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _schoolId;
  int? get schoolId => _$this._schoolId;
  set schoolId(int? schoolId) => _$this._schoolId = schoolId;

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

  String? _activity;
  String? get activity => _$this._activity;
  set activity(String? activity) => _$this._activity = activity;

  EducationExpEditRequestBuilder() {
    EducationExpEditRequest._defaults(this);
  }

  EducationExpEditRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _schoolId = $v.schoolId;
      _educationType = $v.educationType;
      _beginYear = $v.beginYear;
      _endYear = $v.endYear;
      _majorId = $v.majorId;
      _activity = $v.activity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EducationExpEditRequest other) {
    _$v = other as _$EducationExpEditRequest;
  }

  @override
  void update(void Function(EducationExpEditRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EducationExpEditRequest build() => _build();

  _$EducationExpEditRequest _build() {
    final _$result = _$v ??
        _$EducationExpEditRequest._(
          id: id,
          schoolId: schoolId,
          educationType: educationType,
          beginYear: beginYear,
          endYear: endYear,
          majorId: majorId,
          activity: activity,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
