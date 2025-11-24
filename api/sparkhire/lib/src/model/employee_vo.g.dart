// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmployeeVO extends EmployeeVO {
  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? age;
  @override
  final String? profile;
  @override
  final String? skillTags;
  @override
  final BuiltList<EmployeeQualificationVO>? qualificationList;
  @override
  final int? education;
  @override
  final int? graduationYear;
  @override
  final int? jobStatus;
  @override
  final int? cityId;
  @override
  final String? cityName;
  @override
  final num? latitude;
  @override
  final num? longitude;

  factory _$EmployeeVO([void Function(EmployeeVOBuilder)? updates]) =>
      (EmployeeVOBuilder()..update(updates))._build();

  _$EmployeeVO._(
      {this.id,
      this.userId,
      this.age,
      this.profile,
      this.skillTags,
      this.qualificationList,
      this.education,
      this.graduationYear,
      this.jobStatus,
      this.cityId,
      this.cityName,
      this.latitude,
      this.longitude})
      : super._();
  @override
  EmployeeVO rebuild(void Function(EmployeeVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeVOBuilder toBuilder() => EmployeeVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeeVO &&
        id == other.id &&
        userId == other.userId &&
        age == other.age &&
        profile == other.profile &&
        skillTags == other.skillTags &&
        qualificationList == other.qualificationList &&
        education == other.education &&
        graduationYear == other.graduationYear &&
        jobStatus == other.jobStatus &&
        cityId == other.cityId &&
        cityName == other.cityName &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jc(_$hash, skillTags.hashCode);
    _$hash = $jc(_$hash, qualificationList.hashCode);
    _$hash = $jc(_$hash, education.hashCode);
    _$hash = $jc(_$hash, graduationYear.hashCode);
    _$hash = $jc(_$hash, jobStatus.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, cityName.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmployeeVO')
          ..add('id', id)
          ..add('userId', userId)
          ..add('age', age)
          ..add('profile', profile)
          ..add('skillTags', skillTags)
          ..add('qualificationList', qualificationList)
          ..add('education', education)
          ..add('graduationYear', graduationYear)
          ..add('jobStatus', jobStatus)
          ..add('cityId', cityId)
          ..add('cityName', cityName)
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class EmployeeVOBuilder implements Builder<EmployeeVO, EmployeeVOBuilder> {
  _$EmployeeVO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _profile;
  String? get profile => _$this._profile;
  set profile(String? profile) => _$this._profile = profile;

  String? _skillTags;
  String? get skillTags => _$this._skillTags;
  set skillTags(String? skillTags) => _$this._skillTags = skillTags;

  ListBuilder<EmployeeQualificationVO>? _qualificationList;
  ListBuilder<EmployeeQualificationVO> get qualificationList =>
      _$this._qualificationList ??= ListBuilder<EmployeeQualificationVO>();
  set qualificationList(
          ListBuilder<EmployeeQualificationVO>? qualificationList) =>
      _$this._qualificationList = qualificationList;

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

  String? _cityName;
  String? get cityName => _$this._cityName;
  set cityName(String? cityName) => _$this._cityName = cityName;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  EmployeeVOBuilder() {
    EmployeeVO._defaults(this);
  }

  EmployeeVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _age = $v.age;
      _profile = $v.profile;
      _skillTags = $v.skillTags;
      _qualificationList = $v.qualificationList?.toBuilder();
      _education = $v.education;
      _graduationYear = $v.graduationYear;
      _jobStatus = $v.jobStatus;
      _cityId = $v.cityId;
      _cityName = $v.cityName;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmployeeVO other) {
    _$v = other as _$EmployeeVO;
  }

  @override
  void update(void Function(EmployeeVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmployeeVO build() => _build();

  _$EmployeeVO _build() {
    _$EmployeeVO _$result;
    try {
      _$result = _$v ??
          _$EmployeeVO._(
            id: id,
            userId: userId,
            age: age,
            profile: profile,
            skillTags: skillTags,
            qualificationList: _qualificationList?.build(),
            education: education,
            graduationYear: graduationYear,
            jobStatus: jobStatus,
            cityId: cityId,
            cityName: cityName,
            latitude: latitude,
            longitude: longitude,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'qualificationList';
        _qualificationList?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EmployeeVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
