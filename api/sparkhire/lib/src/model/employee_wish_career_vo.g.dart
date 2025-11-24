// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_wish_career_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmployeeWishCareerVO extends EmployeeWishCareerVO {
  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? careerId;
  @override
  final String? careerName;
  @override
  final int? industryId;
  @override
  final String? industryName;
  @override
  final String? salaryExpectation;
  @override
  final DateTime? createTime;

  factory _$EmployeeWishCareerVO(
          [void Function(EmployeeWishCareerVOBuilder)? updates]) =>
      (EmployeeWishCareerVOBuilder()..update(updates))._build();

  _$EmployeeWishCareerVO._(
      {this.id,
      this.userId,
      this.careerId,
      this.careerName,
      this.industryId,
      this.industryName,
      this.salaryExpectation,
      this.createTime})
      : super._();
  @override
  EmployeeWishCareerVO rebuild(
          void Function(EmployeeWishCareerVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeWishCareerVOBuilder toBuilder() =>
      EmployeeWishCareerVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeeWishCareerVO &&
        id == other.id &&
        userId == other.userId &&
        careerId == other.careerId &&
        careerName == other.careerName &&
        industryId == other.industryId &&
        industryName == other.industryName &&
        salaryExpectation == other.salaryExpectation &&
        createTime == other.createTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, careerId.hashCode);
    _$hash = $jc(_$hash, careerName.hashCode);
    _$hash = $jc(_$hash, industryId.hashCode);
    _$hash = $jc(_$hash, industryName.hashCode);
    _$hash = $jc(_$hash, salaryExpectation.hashCode);
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmployeeWishCareerVO')
          ..add('id', id)
          ..add('userId', userId)
          ..add('careerId', careerId)
          ..add('careerName', careerName)
          ..add('industryId', industryId)
          ..add('industryName', industryName)
          ..add('salaryExpectation', salaryExpectation)
          ..add('createTime', createTime))
        .toString();
  }
}

class EmployeeWishCareerVOBuilder
    implements Builder<EmployeeWishCareerVO, EmployeeWishCareerVOBuilder> {
  _$EmployeeWishCareerVO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _careerId;
  int? get careerId => _$this._careerId;
  set careerId(int? careerId) => _$this._careerId = careerId;

  String? _careerName;
  String? get careerName => _$this._careerName;
  set careerName(String? careerName) => _$this._careerName = careerName;

  int? _industryId;
  int? get industryId => _$this._industryId;
  set industryId(int? industryId) => _$this._industryId = industryId;

  String? _industryName;
  String? get industryName => _$this._industryName;
  set industryName(String? industryName) => _$this._industryName = industryName;

  String? _salaryExpectation;
  String? get salaryExpectation => _$this._salaryExpectation;
  set salaryExpectation(String? salaryExpectation) =>
      _$this._salaryExpectation = salaryExpectation;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  EmployeeWishCareerVOBuilder() {
    EmployeeWishCareerVO._defaults(this);
  }

  EmployeeWishCareerVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _careerId = $v.careerId;
      _careerName = $v.careerName;
      _industryId = $v.industryId;
      _industryName = $v.industryName;
      _salaryExpectation = $v.salaryExpectation;
      _createTime = $v.createTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmployeeWishCareerVO other) {
    _$v = other as _$EmployeeWishCareerVO;
  }

  @override
  void update(void Function(EmployeeWishCareerVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmployeeWishCareerVO build() => _build();

  _$EmployeeWishCareerVO _build() {
    final _$result = _$v ??
        _$EmployeeWishCareerVO._(
          id: id,
          userId: userId,
          careerId: careerId,
          careerName: careerName,
          industryId: industryId,
          industryName: industryName,
          salaryExpectation: salaryExpectation,
          createTime: createTime,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
