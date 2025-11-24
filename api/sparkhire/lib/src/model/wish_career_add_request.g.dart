// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_career_add_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WishCareerAddRequest extends WishCareerAddRequest {
  @override
  final int? careerId;
  @override
  final int? industryId;
  @override
  final String? salaryExpectation;

  factory _$WishCareerAddRequest(
          [void Function(WishCareerAddRequestBuilder)? updates]) =>
      (WishCareerAddRequestBuilder()..update(updates))._build();

  _$WishCareerAddRequest._(
      {this.careerId, this.industryId, this.salaryExpectation})
      : super._();
  @override
  WishCareerAddRequest rebuild(
          void Function(WishCareerAddRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishCareerAddRequestBuilder toBuilder() =>
      WishCareerAddRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishCareerAddRequest &&
        careerId == other.careerId &&
        industryId == other.industryId &&
        salaryExpectation == other.salaryExpectation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, careerId.hashCode);
    _$hash = $jc(_$hash, industryId.hashCode);
    _$hash = $jc(_$hash, salaryExpectation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WishCareerAddRequest')
          ..add('careerId', careerId)
          ..add('industryId', industryId)
          ..add('salaryExpectation', salaryExpectation))
        .toString();
  }
}

class WishCareerAddRequestBuilder
    implements Builder<WishCareerAddRequest, WishCareerAddRequestBuilder> {
  _$WishCareerAddRequest? _$v;

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

  WishCareerAddRequestBuilder() {
    WishCareerAddRequest._defaults(this);
  }

  WishCareerAddRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _careerId = $v.careerId;
      _industryId = $v.industryId;
      _salaryExpectation = $v.salaryExpectation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WishCareerAddRequest other) {
    _$v = other as _$WishCareerAddRequest;
  }

  @override
  void update(void Function(WishCareerAddRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WishCareerAddRequest build() => _build();

  _$WishCareerAddRequest _build() {
    final _$result = _$v ??
        _$WishCareerAddRequest._(
          careerId: careerId,
          industryId: industryId,
          salaryExpectation: salaryExpectation,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
