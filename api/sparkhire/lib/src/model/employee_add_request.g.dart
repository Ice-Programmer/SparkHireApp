// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_add_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmployeeAddRequest extends EmployeeAddRequest {
  @override
  final int? age;
  @override
  final String? profile;
  @override
  final BuiltList<String>? skillTags;
  @override
  final BuiltList<int>? qualifications;
  @override
  final int? education;
  @override
  final int? graduationYear;
  @override
  final int? jobStatus;
  @override
  final int? cityId;
  @override
  final num? latitude;
  @override
  final num? longitude;

  factory _$EmployeeAddRequest(
          [void Function(EmployeeAddRequestBuilder)? updates]) =>
      (EmployeeAddRequestBuilder()..update(updates))._build();

  _$EmployeeAddRequest._(
      {this.age,
      this.profile,
      this.skillTags,
      this.qualifications,
      this.education,
      this.graduationYear,
      this.jobStatus,
      this.cityId,
      this.latitude,
      this.longitude})
      : super._();
  @override
  EmployeeAddRequest rebuild(
          void Function(EmployeeAddRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeAddRequestBuilder toBuilder() =>
      EmployeeAddRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeeAddRequest &&
        age == other.age &&
        profile == other.profile &&
        skillTags == other.skillTags &&
        qualifications == other.qualifications &&
        education == other.education &&
        graduationYear == other.graduationYear &&
        jobStatus == other.jobStatus &&
        cityId == other.cityId &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jc(_$hash, skillTags.hashCode);
    _$hash = $jc(_$hash, qualifications.hashCode);
    _$hash = $jc(_$hash, education.hashCode);
    _$hash = $jc(_$hash, graduationYear.hashCode);
    _$hash = $jc(_$hash, jobStatus.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmployeeAddRequest')
          ..add('age', age)
          ..add('profile', profile)
          ..add('skillTags', skillTags)
          ..add('qualifications', qualifications)
          ..add('education', education)
          ..add('graduationYear', graduationYear)
          ..add('jobStatus', jobStatus)
          ..add('cityId', cityId)
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class EmployeeAddRequestBuilder
    implements Builder<EmployeeAddRequest, EmployeeAddRequestBuilder> {
  _$EmployeeAddRequest? _$v;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _profile;
  String? get profile => _$this._profile;
  set profile(String? profile) => _$this._profile = profile;

  ListBuilder<String>? _skillTags;
  ListBuilder<String> get skillTags =>
      _$this._skillTags ??= ListBuilder<String>();
  set skillTags(ListBuilder<String>? skillTags) =>
      _$this._skillTags = skillTags;

  ListBuilder<int>? _qualifications;
  ListBuilder<int> get qualifications =>
      _$this._qualifications ??= ListBuilder<int>();
  set qualifications(ListBuilder<int>? qualifications) =>
      _$this._qualifications = qualifications;

  int? _education;
  int? get education => _$this._education;
  set education(int? education) => _$this._education = education;

  int? _graduationYear;
  int? get graduationYear => _$this._graduationYear;
  set graduationYear(int? graduationYear) =>
      _$this._graduationYear = graduationYear;

  int? _jobStatus;
  int? get jobStatus => _$this._jobStatus;
  set jobStatus(int? jobStatus) => _$this._jobStatus = jobStatus;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  EmployeeAddRequestBuilder() {
    EmployeeAddRequest._defaults(this);
  }

  EmployeeAddRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _age = $v.age;
      _profile = $v.profile;
      _skillTags = $v.skillTags?.toBuilder();
      _qualifications = $v.qualifications?.toBuilder();
      _education = $v.education;
      _graduationYear = $v.graduationYear;
      _jobStatus = $v.jobStatus;
      _cityId = $v.cityId;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmployeeAddRequest other) {
    _$v = other as _$EmployeeAddRequest;
  }

  @override
  void update(void Function(EmployeeAddRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmployeeAddRequest build() => _build();

  _$EmployeeAddRequest _build() {
    _$EmployeeAddRequest _$result;
    try {
      _$result = _$v ??
          _$EmployeeAddRequest._(
            age: age,
            profile: profile,
            skillTags: _skillTags?.build(),
            qualifications: _qualifications?.build(),
            education: education,
            graduationYear: graduationYear,
            jobStatus: jobStatus,
            cityId: cityId,
            latitude: latitude,
            longitude: longitude,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skillTags';
        _skillTags?.build();
        _$failedField = 'qualifications';
        _qualifications?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EmployeeAddRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
