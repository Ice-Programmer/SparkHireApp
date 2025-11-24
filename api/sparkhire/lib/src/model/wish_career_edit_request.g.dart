// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_career_edit_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WishCareerEditRequest extends WishCareerEditRequest {
  @override
  final int? id;
  @override
  final int? careerId;
  @override
  final int? industryId;
  @override
  final String? salaryExpectation;

  factory _$WishCareerEditRequest(
          [void Function(WishCareerEditRequestBuilder)? updates]) =>
      (WishCareerEditRequestBuilder()..update(updates))._build();

  _$WishCareerEditRequest._(
      {this.id, this.careerId, this.industryId, this.salaryExpectation})
      : super._();
  @override
  WishCareerEditRequest rebuild(
          void Function(WishCareerEditRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishCareerEditRequestBuilder toBuilder() =>
      WishCareerEditRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishCareerEditRequest &&
        id == other.id &&
        careerId == other.careerId &&
        industryId == other.industryId &&
        salaryExpectation == other.salaryExpectation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, careerId.hashCode);
    _$hash = $jc(_$hash, industryId.hashCode);
    _$hash = $jc(_$hash, salaryExpectation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WishCareerEditRequest')
          ..add('id', id)
          ..add('careerId', careerId)
          ..add('industryId', industryId)
          ..add('salaryExpectation', salaryExpectation))
        .toString();
  }
}

class WishCareerEditRequestBuilder
    implements Builder<WishCareerEditRequest, WishCareerEditRequestBuilder> {
  _$WishCareerEditRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _careerId;
  int? get careerId => _$this._careerId;
  set careerId(int? careerId) => _$this._careerId = careerId;

  int? _industryId;
  int? get industryId => _$this._industryId;
  set industryId(int? industryId) => _$this._industryId = industryId;

  String? _salaryExpectation;
  String? get salaryExpectation => _$this._salaryExpectation;
  set salaryExpectation(String? salaryExpectation) =>
      _$this._salaryExpectation = salaryExpectation;

  WishCareerEditRequestBuilder() {
    WishCareerEditRequest._defaults(this);
  }

  WishCareerEditRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _careerId = $v.careerId;
      _industryId = $v.industryId;
      _salaryExpectation = $v.salaryExpectation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WishCareerEditRequest other) {
    _$v = other as _$WishCareerEditRequest;
  }

  @override
  void update(void Function(WishCareerEditRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WishCareerEditRequest build() => _build();

  _$WishCareerEditRequest _build() {
    final _$result = _$v ??
        _$WishCareerEditRequest._(
          id: id,
          careerId: careerId,
          industryId: industryId,
          salaryExpectation: salaryExpectation,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
